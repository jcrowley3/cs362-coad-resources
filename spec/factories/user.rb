FactoryBot.define do
    factory :user do
        email {"fake@fake.com"}
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