FactoryBot.define do
    
    factory :ticket do
        sequence(:name) { |n| "Fake Name#{n}"}
        phone {'000-000-0000'}
        region_id {'1'}
        resource_category_id {'1'}
    end
end