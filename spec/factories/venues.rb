# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name "MyString"
    address_1 "MyString"
    address_2 "MyString"
    post_code "MyString"
    description "MyString"
    user_id 1
  end
end
