class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save {self.email = email.downcase}
  validates :chefname, presence: true,
            length: {minimum: 10, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 30},
                    uniqueness: {case_sensitive: false},
                    format: {with: VALID_EMAIL_REGEX}
end

