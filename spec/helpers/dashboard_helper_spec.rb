require 'rails_helper'

RSpec.describe DashboardHelper, type: :helper do

    describe 'dashboard for' do

        it 'sends admin user to admin dashboard' do
            admin_user = create(:user, :admin)
            expect(helper.dashboard_for(admin_user)).to eq('admin_dashboard')
        end

        it 'sends submitted organizations to submitted dashboard' do
            org_user = create(:user, organization: Organization.new)
            expect(helper.dashboard_for(org_user)).to eq('organization_submitted_dashboard')
        end

        it 'sends approved organization to approved dashboard' do
            organization = create(:organization, :approved)
            app_user = create(:user, organization: organization)
            expect(helper.dashboard_for(app_user)).to eq('organization_approved_dashboard')
        end

        it 'sends unknown users to default dashboard' do
            user = create(:user)
            expect(helper.dashboard_for(user)).to eq('create_application_dashboard')
        end
    end
end
