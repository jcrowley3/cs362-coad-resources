require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
    let(:admin) { create(:user, :admin) }
    let(:organization) {create(:organization, name: "Fake Organization")}

    before :each do
        log_in_as(admin)
    end

    context 'Reject organization application' do
        it 'is rejected' do
            visit organization_path(organization)
            fill_in 'Rejection Reason', with: 'Test'
            click_on 'Reject'
            expect(page).to have_content('has been rejected')
        end
    end
end
