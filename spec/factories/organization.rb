FactoryBot.define do
    factory :organization do
        email {"fake@fake.com"}
        name {"fake name"}
        phone {'000-000-0000'}
        description {'test organization'}
        primary_name {"Fake"}
        secondary_name {"Fake"}
        secondary_phone {'000-000-0000'}
        title {'title'}
        transportation {:yes}

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