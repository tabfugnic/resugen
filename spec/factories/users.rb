
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com"}
    #email_confirmation { |u| u.email }
    given_name "Jamie"
    family_name "Doe"
    password "1234567"
    password_confirmation { |u| u.password }
  end
end
