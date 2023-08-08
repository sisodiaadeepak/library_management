# app/models/user.rb
# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  #Validations
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  #Associations
  has_many :books
end
