require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
    
    it 'new user signs up' do
        visit signup_path
        fill_in "Email address", with: "FakeEmail@fake.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on 'commit'
        expect(page).to have_content("confirmation link has been sent to your email address")
        expect(current_path).to eq(root_path)
    end
    
end
