# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address1 "86th West Example Lane"
    address2 "Apt 84B"
    city "Example"
    country "USA"
    state "Maine"
    home false
    zip_code 53343
    user
  end
end
