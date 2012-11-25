# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    name "MyString"
    title "MyString"
    summary "MyString"
    begin_date "2012-11-10"
    end_date "2012-11-10"
    association :detail
  end
end
