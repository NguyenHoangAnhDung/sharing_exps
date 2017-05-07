class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX},
    length: {maximum: 255}
  has_secure_password

  has_many :posts, dependent: :destroy
end
