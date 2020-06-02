FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "fake#{n}@fake.com"}
        password {"password123"}
        password_confirmation {"password123"}

        trait :admin do
            role { :admin }
        end

        after :create do |user|
            user.confirm
        end

    end
end
