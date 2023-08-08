# app/models/library.rb
# frozen_string_literal: true

# Represents a library in the system.
class Library < ApplicationRecord
  has_many :books, dependent: :destroy
end
