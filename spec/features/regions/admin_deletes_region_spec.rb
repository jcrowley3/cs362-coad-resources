require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

    let(:admin) {create(:user, :admin)}
    let(:region) {create(:region, name: "Fake test")}

    before :each do
        log_in_as(admin)
    end

    context 'deleting a region' do
        it 'success' do
            visit region_path(region)
            click_on "Delete"   
            expect(page).to have_content("Associated tickets now belong to the 'Unspecified' region")
        end
    end
end
