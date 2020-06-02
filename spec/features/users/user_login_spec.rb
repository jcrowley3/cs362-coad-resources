require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
	let(:user) { create(:user) }

	it 'login: done from Home screen and redirects user to the dashboard' do
		visit root_path
		click_on("Log in")
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		find_by_id('commit').click
		expect(current_path).to eq(dashboard_path)
	end

	it 'user logins with wrong email' do
		visit root_path
		click_on("Log in")
		fill_in "Email", with: "Fake@email.com"
		fill_in "Password", with: user.password
		find_by_id('commit').click
		expect(page).to have_content("Invalid Email or password")
		expect(current_path).to eq('/users/sign_in')
	end

	it 'user logins with wrong password' do
		visit root_path
		click_on("Log in")
		fill_in "Email", with: user.email
		fill_in "Password", with: "Fake password"
		find_by_id('commit').click
		expect(page).to have_content("Invalid Email or password")
		expect(current_path).to eq('/users/sign_in')

	end
end
