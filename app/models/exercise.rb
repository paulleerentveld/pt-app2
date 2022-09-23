class Exercise < ApplicationRecord
    has_many :exercise_workouts
    has_many :workouts, through: :exercise_workouts

    validates :name, presence: true
    validates :description, presence: true
    validates :description, length: {minimum:20}


end
