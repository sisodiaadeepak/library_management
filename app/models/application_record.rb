# app/models/application_record.rb
# frozen_string_literal: true

# The base class for all models in the application.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
