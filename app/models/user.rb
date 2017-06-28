class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
    presence: true,
    length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password,
    presence: true,
    length: {minimum: 6}
  validates :name,
    presence: true,
    length: {maximum: 50}
  has_secure_password

  before_save :downcase

  private

  def downcase
    email.downcase!
  end
end
