FactoryGirl.define do  factory :line do
    content "MyString"
story nil
user nil
  end

  factory :user do
    email 'fake3@fake.com'
    password 'password'
  end
end
