class InstructorsController < ApplicationController

    def index
        @instructors = Instructor.all
    end

    def show
        @instructor = Instructor.find(params[:id])
    end

    def new
        @instructor = Instructor.new
    end

    def edit
    end

    def create
        @instructor = Instructor.new(instructor_params)
        if @instructor.save
            redirect_to @instructor
          else
            render "new"
        end
    end

    def update
        if @instructor.update(instructor_params)
            redirect_to instructor_url(@instructor), notice: "Instructor was successfully updated."
          else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @instructor.destroy
        redirect_to instructor_url, notice: "Instructor was successfully destroyed."
    end
    

    private

    def instructor_params
        params.require(:instructor).permit(:firstname, :lastname, :email, :mobile)
    end

end
