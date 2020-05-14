require 'rails_helper'

RSpec.describe User, type: :model do

    let(:user){User.new(email:'fakeemail@gmail.com', password: 'PASSWORD')}

    it {should belong_to(:organization)}
    it "has an email" do
        #user = User.new
        expect(user).to respond_to(:email)
    end

    describe "validations" do
        it "validates email" do
            expect(user).to validate_presence_of(:email)
        end
        it "validates length of email" do
            expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
        end
        it "validates uniqueness of email" do
            expect(user).to validate_uniqueness_of(:email).case_insensitive
        end
        it "validates presence of password" do
            expect(user).to validate_presence_of(:password)
        end
        it "validates length of password" do
            expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
        end
    end

end
