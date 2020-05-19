require 'rails_helper'

RSpec.describe Organization, type: :model do

#let(:org) {Organization.new(name: "FAKE", email: "dataCollection@gmail.com")}

	describe "attributes" do

	  #need to rafactor agreements
	  it "should have agreement_one" do
	    expect(organization).to respond_to(agreement_one)
	  end
	  it "should have agreement_two" do
	    expect(organization).to respond_to(agreement_two)
	  end
	  it "should have agreement_three" do
	    expect(organization).to respond_to(agreement_three)
	  end
	  it "should have agreement_four" do
	    expect(organization).to respond_to(agreement_four)
	  end
	  it "should have agreement_five" do
	    expect(organization).to respond_to(agreement_five)
	  end
	  it "should have agreement_six" do
	    expect(organization).to respond_to(agreement_six)
	  end
	  it "should have agreement_seven" do
	    expect(organization).to respond_to(agreement_seven)
	  end
	  it "should have aggreement_eight" do
	    expect(organization).to respond_to(agreement_eight)
	  end
	  it "has a email" do
		expect(organization).to respond_to(:email)
	  end
	  it "has a email" do
		expect(organization).to respond_to(:email)
	  end
	  it "has a name" do
		expect(organization).to respond_to(:name)
	  end
	  it "has a phone" do
		expect(organization).to respond_to(:phone)
	  end
	  it "has a status" do
		expect(organization).to respond_to(:status)
	  end
	  it "has a primary name" do
		expect(organization).to respond_to(:primary_name)
	  end
	  it "has a secondary name" do
		expect(organization).to respond_to(:secondary_name)
	  end
	  it "has a secondary phone" do
		expect(organization).to respond_to(:secondary_phone)
	  end
	  it "has a transportation" do
		expect(organization).to respond_to(:transportation)
	  end

	end

	describe "relationship" do
	    it "has many users" do
	         expect(organization).to have_many(:users)
	    end

		it "has many tichets" do
	         expect(organization).to have_many(:tickets)
	    end

		it "has and belongs to many resources categories" do
	         expect(organization).to have_and_belong_to_many(:resource_categories)
	    end
	end

	describe "validations" do
		it "validates email" do
			expect(user).to validate_presence_of(:email)
		end
		it "validates length of email" do
			expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
		end
		#it "validates email address" do
			# ??
		#end
		it "validates uniqueness of email" do
			expect(user).to validate_uniqueness_of(:email).case_insensitive
		end
		it "validates length of name" do
			expect(user).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end
		it "validates uniqueness of name" do
			expect(user).to validate_uniqueness_of(:name).case_insensitive
		end
		it "validates length of description" do
			expect(user).to validate_length_of(:description).is_at_most(1020).on(:create)
		end
	end

	describe "#to_s" do
	    it " has a string representation that is a name" do
	         expect_name = "FAKE"
	         expect(organization).to eq(expected_name)
	        end
	    end
	end
end
