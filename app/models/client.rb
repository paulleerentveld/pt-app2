class Client < ApplicationRecord
  belongs_to :instructor
  has_many :client_workouts
  has_many :workouts, through: :client_workouts


  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: true
  validates :mobile, uniqueness: true
  validates :sex, inclusion: { in: ["Male", "Female"]}
  validates :weight, length: {in:20-300}
  validates :height, length: {in:20-300}



end
