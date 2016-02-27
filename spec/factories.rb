FactoryGirl.define do
  factory :reward_user do
    reward nil
    user nil
  end
  factory :reward do
    cost 1
    name "MyString"
    reward_users nil
  end
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