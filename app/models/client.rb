class Client < ApplicationRecord
  belongs_to :instructor
  has_many :client_workouts
  #has_many :workouts, through: :client_workouts
  has_many :workouts, -> { select('workouts.*, client_workouts.date as date, client_workouts.status as status') }, :through => :client_workouts


  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :mobile, uniqueness: true
  validates_length_of :mobile, is: 10, :message => "must have 10 digits"
  validates :mobile, :format => {:with => /\A04/ , :message => "must start with 04"}
  validates :sex, inclusion: { in: ["Male", "Female"]}
  validates :weight, numericality: { greater_than_or_equal_to: 20, less_than_or_equal_to: 300 }
  validates :height, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 250 }

  def workout_details
    workouts + client_workouts
  end

end
