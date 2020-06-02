require 'rails_helper'

RSpec.describe 'Deleting a Resource Category:', type: :feature do

	let(:admin) {create(:user, :admin)}
	let(:resource_category) {create(:resource_category)}

	before :each do
			log_in_as(admin)
	end

	context 'admin user' do
		it "deletes a resurce category" do
			visit new_resource_category_path
			fill_in 'Name', with: 'Fake Category'
			click_on "Add Resource Category"
			expect(page).to have_content("Category successfully created")
			click_on 'Fake Category'
			click_on 'Delete'
			#page.accept_alert
			expect(page).to have_content("Associated tickets now belong")
		end
	end

end
