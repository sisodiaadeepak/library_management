# frozen_string_literal: true

FactoryBot.define do
  FactoryBot.use_parent_strategy = false
  factory :user do
    name { 'Test' }
    email { 'test@gmail.com' }
    password { 'password' }
    username {'test'}
  end

  factory :library do
    name { 'Delhi Library' }
  end

end
