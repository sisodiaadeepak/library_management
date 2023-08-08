# app/models/application_record.rb
# frozen_string_literal: true

# The base class for all models in the application.
class Book < ApplicationRecord
  belongs_to :library
  belongs_to :user, foreign_key: "checked_out_by", optional: true
  validates :status, inclusion: { in: %w[available checked_out] }
  enum status: { available: 0, checked_out: 1 }
end
