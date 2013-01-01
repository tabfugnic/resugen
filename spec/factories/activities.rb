# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    name "MyString"
    title "MyString"
    summary "MyString"
    begin_date "2012-11-10"
    end_date "2012-11-10"
    user
    factory :employment, :class => Employment do
      _type Employment
    end
    factory :project, :class => Project do
      _type Project
    end
    factory :education, :class => Education do
      _type Education
      score 3.5
      max_score 4.0
    end
  end
end
