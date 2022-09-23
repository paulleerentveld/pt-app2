class WorkoutsController < ApplicationController

    def index
        @workouts = Workout.all
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def new
        @workout = Workout.new
        @exercises = Exercise.all
    end

    def edit
        @workout = Workout.find(params[:id])
    end

    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to @workout
          else
            render "new"
        end
    end

    def update
        @workout = Workout.find(params[:id])
        if @workout.update(workout_params)
            redirect_to workout_url(@workout), notice: "Workout was successfully updated."
          else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @workout = Workout.find(params[:id])
        @workout.destroy
        redirect_to exercise_url, notice: "Workout was successfully destroyed."
    end
    

    private

    def workout_params
        params.require(:workout).permit(:workouttype, :status, exercise_ids:[])
    end


end
