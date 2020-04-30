FactoryBot.define do

  factory :user do
    email
    pasword {"fake password"}
    trait :admin do
      role { 'admin' }
    end

/*    trait :organization_approved do
      role { 'organization' }
      organization
    end
*/

    after(:create) do |user|
      user.confirm
    end

  end

end
