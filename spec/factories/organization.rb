FactoryBot.define do
    factory :organization do
        sequence(:name) { |n| "Fake Name#{n}"}
        phone {'000-000-0000'}
        sequence(:email) { |n| "fake#{n}@fake.com"}
        description {'test organization'}
        primary_name {"Fake"}
        secondary_name {"Fake"}
        secondary_phone {'000-000-0000'}
        title {'title'}
        transportation {:yes}
        liability_insurance{:yes}

        trait :approved do
            status { 0 }
        end

        trait :rejected do
            status { 2 }
        end

        trait :locked do
            status { 3 }
        end
    end
end