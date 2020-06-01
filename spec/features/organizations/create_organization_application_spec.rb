require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

    context "organization application" do

        it "fills organization application form" do
            create(:user)
            visit '/login'
            fill_in 'Email address', with: 'faker@fake.com'
            fill_in 'Password', with: 'password'
            click_on 'Sign in'


            visit '/new_organization_application'
            choose "organization_liability_insurance_true"
            choose "organization_agreement_one_true"
            choose "organization_agreement_two_true"
            choose "organization_agreement_three_true"
            choose "organization_agreement_four_true"
            choose "organization_agreement_five_true"
            choose "organization_agreement_six_true"
            choose "organization_agreement_seven_true"
            choose "organization_agreement_eight_true"
            fill_in 'organization_primary_name', with: 'fake'
            fill_in 'organization_name', with: 'fake'
            fill_in 'organization_title', with: 'fake'
            fill_in 'organization_phone', with: '0000000000'
            fill_in 'organization_secondary_name', with: 'fake'
            fill_in 'organization_secondary_phone', with: '0000000000'
            fill_in 'organization_email', with: 'fake@fake.com'
            fill_in 'organization_description', with: 'fake application desc'
            choose "organization_transportation_yes"
            click_on "Apply"
            save_and_open_page
        end
    end

end
