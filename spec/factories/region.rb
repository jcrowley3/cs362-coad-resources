FactoryBot.define do
    factory :region do
        sequence :name do |n| "FAKE #{n}" end
    end
end