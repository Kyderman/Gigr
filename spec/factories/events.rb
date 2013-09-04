# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyString"
    user_id 1
    date "2013-09-04 15:26:48"
  end
end
