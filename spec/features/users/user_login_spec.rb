require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
	let(:user) { create(:user) }

	it 'login: done from Home screen and redirects user to the dashboard' do
		visit root_path
		click_on("Log in") #needs to match the wording on the website page
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		find_by_id('commit').click
		expect(current_path).to eq(dashboard_path)
	end
end
