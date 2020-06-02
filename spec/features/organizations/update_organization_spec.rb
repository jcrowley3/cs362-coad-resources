require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
    let(:organization) {create(:organization, :approved) }
    let(:user) {create(:user, organization: organization)}
    
    before :each do
        log_in_as(user)
    end

   context 'as an organization' do
    it 'edits its organization information' do
        visit edit_organization_path(organization)
        fill_in 'Name', with: "New Name Fake Organization"
        click_on 'Update Resource'
        expect(page).to have_content("New Name Fake Organization")
    end
   end
end
