FactoryGirl.define do
  factory :user do 
    first_name 'First'
    sequence(:last_name) { |n| "Last-#{n}" }
    email 'fake@email.com'
    encrypted_password 'encrypted_password'
  end
end