# frozen_string_literal: true

# Class to create the libraries table
class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name

      t.timestamps
    end
  end
end
