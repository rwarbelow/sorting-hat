FactoryGirl.define do
  factory :point do
    value 1
    user nil
  end
  factory :user do
    username "MyString"
    password_digest "MyString"
    role 1
  end
end