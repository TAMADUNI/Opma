FactoryBot.define do
  factory :user do
    email { 'maja@gmail.com' }
    password { '123' }
    password_confirmation { '123' }
    association :department, factory: :department
  end
end
