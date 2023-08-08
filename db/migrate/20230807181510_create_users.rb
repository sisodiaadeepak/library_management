# frozen_string_literal: true

# Class to create the users table
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
