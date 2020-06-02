FactoryBot.define do
    factory :resource_category do
        sequence :name do |n| "FAKE #{n}" end
    end
    
    trait :active do
        activate {true}
    end
    trait :inactive do
        activate {false}
    end
end