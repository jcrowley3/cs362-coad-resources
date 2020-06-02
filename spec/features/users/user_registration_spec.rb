require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
    before :each do
        create(:user, email: 'TestFake@fake.com')
    end

    it 'new user signs up' do
        visit signup_path
        fill_in "Email address", with: "FakeEmail@fake.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on 'commit'
        expect(page).to have_content("confirmation link has been sent to your email address")
        expect(current_path).to eq(root_path)
    end

    it 'new user tries to sign up and email already taken' do
        visit signup_path
        fill_in "Email address", with: "TestFake@fake.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on 'commit'
        expect(page).to have_content("Email has already been taken")
        expect(current_path).to eq('/users')
    end

    it 'didnt get an email' do
        visit signup_path
        fill_in "Email address", with: ""
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on 'commit'
        expect(page).to have_content("Email can't be blank")
        expect(current_path).to eq('/users')
    end

    it 'didnt get a password' do
        visit signup_path
        fill_in "Email address", with: "TestFake@fake.com"
        fill_in "Password", with: ""
        fill_in "Password confirmation", with: "password"
        click_on 'commit'
        expect(page).to have_content("Password can't be blank")
        expect(current_path).to eq('/users')
    end

    it 'didnt get a confirmation password' do
        visit signup_path
        fill_in "Email address", with: "TestFake@fake.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: ""
        click_on 'commit'
        expect(page).to have_content("Password confirmation doesn't match Password")
        expect(current_path).to eq('/users')
    end

end
