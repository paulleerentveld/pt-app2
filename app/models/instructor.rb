class Instructor < ApplicationRecord
    has_many :clients

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    validates :mobile, uniqueness: true
    validates_length_of :mobile, is: 10, :message => "must have 10 digits"
    validates :mobile, :format => {:with => /\A04/ , :message => "must start with 04"}




    def name
        self.firstname + " " + self.lastname
    end

end
