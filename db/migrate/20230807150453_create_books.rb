# frozen_string_literal: true

# Class to create the books table
class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :status
      t.references :library, null: false, foreign_key: true
      t.integer :checked_out_by

      t.timestamps
    end
  end
end
