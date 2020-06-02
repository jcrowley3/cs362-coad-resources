require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

    let(:admin) {create(:user, :admin)}
    
    before :each do
        log_in_as(admin)
    end

    context 'creating a region' do
        it 'success' do
            visit new_region_path
            fill_in "Name", with: "New Region Test"
            click_on "Add Region"
            expect(page).to have_content("Region successfully created")
            expect(current_path).to eq("/regions")
        end

        it 'already exists' do
            create(:region, name: "Fake test")
            visit new_region_path
            fill_in "Name", with: "Fake test"
            click_on "Add Region"
            expect(page).to have_content("Name has already been taken")
            expect(current_path).to eq("/regions")
            
        end

        it 'doesnt have a name' do
            visit new_region_path
            click_on "Add Region"
            expect(page).to have_content("Name can't be blank")
            expect(current_path).to eq("/regions")
        end
    end
end
