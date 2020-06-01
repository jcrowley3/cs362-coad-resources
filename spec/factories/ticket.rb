FactoryBot.define do
    factory :ticket do
        sequence(:name) { |n| "Fake Name#{n}"}
        description {'FAKE'}
        phone {'000-000-0000'}
        region_id {create(:region).id}
        resource_category_id {create(:resource_category).id}

        trait :open do
            closed {false}
        end

        trait :closed do
            closed {true}
        end
    end
end