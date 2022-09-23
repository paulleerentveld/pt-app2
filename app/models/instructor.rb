class Instructor < ApplicationRecord
    has_many :clients

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, uniqueness: true
    validates :mobile, uniqueness: true




    def name
        self.firstname + " " + self.lastname
    end

end
