class Client < ApplicationRecord
  belongs_to :instructor
  has_many client_workouts
  has_many :workouts, through: :client_workouts
end
