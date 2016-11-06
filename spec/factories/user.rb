FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password  "password"
    admin false

    factory :admin, class: User do
      email "admin@example.com"
      password  "password"
      admin      true
    end
  end
end
