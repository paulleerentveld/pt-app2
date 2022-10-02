class Workout < ApplicationRecord
    has_many :exercise_workouts
    has_many :client_workouts
    has_many :exercises, through: :exercise_workouts
    has_many :clients, through: :client_workouts
    

    accepts_nested_attributes_for :client_workouts

    validates :name, presence: true
    validates :workouttype, presence: true
    validates :workouttype, inclusion: { in: ["Aerobic", "Strength", "Mobility", "BodyBuilding"]}

    scope :type, ->(input = ["Aerobic", "Strength", "Mobility", "BodyBuilding"]) {where("workouttype IN (?)", input)}


    def self.exercise_ids
        Exercise.all
    end


end
