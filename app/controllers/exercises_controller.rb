class ExercisesController < ApplicationController

    def index
        @exercises = Exercise.all
    end

    def show
        @exercise = Exercise.find(params[:id])
    end

    def new
        @exercise = Exercise.new
    end

    def edit
        @exercise = Exercise.find(params[:id])
    end

    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            redirect_to @exercise
          else
            render "new"
        end
    end

    def update
        @exercise = Exercise.find(params[:id])
        if @exercise.update(exercise_params)
            redirect_to exercise_url(@exercise), notice: "Exercise was successfully updated."
          else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @exercise = Exercise.find(params[:id])
        @exercise.destroy
        redirect_to exercise_url, notice: "Exercise was successfully destroyed."
    end
    

    private

    def exercise_params
        params.require(:exercise).permit(:name, :description, :image, :url)
    end


end
