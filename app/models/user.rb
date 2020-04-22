class User < ApplicationRecord
  validates :username, presence: true,
            length: {minimum: 3, maximum: 25},
            uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,} \z/i
  validates :email, presence: true,
            length: {minimum: 10, maximum: 150},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX, }

end