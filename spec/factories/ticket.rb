FactoryBot.define do
    factory :ticket do
        sequence(:name) { |n| "Fake Name#{n}" }
        phone { '55555555511' }
        region_id {create(:region).id}
        resource_category_id { create(:resource_category).id }
        organization
        description { 'FAKE' }

        trait :open do
            closed { false }
        end

        trait :closed do
            closed { true }
        end
    end
end