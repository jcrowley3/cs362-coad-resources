require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

    let(:admin) { create(:user, :admin) }
    let(:organization) {create(:organization, name: "Fake Organization")}

    before :each do
        log_in_as(admin)
    end

    context 'Approve organization application' do
        it 'is approved' do
            visit organization_path(organization)
            #click_on "Fake Organization"
            click_on 'Approve'
            expect(page).to have_content('has been approved')
        end
    end

end
