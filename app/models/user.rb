class User < ApplicationRecord
  before_save { self.email = email.downcase}
  has_many :articles

  validates :username, presence: true,
            length: {minimum: 3, maximum: 25},
            uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-zA-Z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,}\z/i
  validates :email, presence: true,
            length: {minimum: 10, maximum: 150},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX, }

   has_secure_password
end