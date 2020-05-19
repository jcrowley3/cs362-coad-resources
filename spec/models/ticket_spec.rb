require 'rails_helper'

RSpec.describe Ticket, type: :model do

	let(:ticket) { Ticket.new }
	let(:organization) { Organization.new(name: 'FAKE', email: "dataCollection@gmail.com") }

  #let(:closed_ticket) { build(:closed_ticket) }
  #let(:open_ticket) { build(:open_ticket) }

  describe "attributes" do
  	specify{expect(ticket).to respond_to(:name)}
		specify{expect(ticket).to respond_to(:phone)}
		specify{expect(ticket).to respond_to(:region_id)}
		specify{expect(ticket).to respond_to(:resource_category_id)}
		specify{expect(ticket).to respond_to(:description)}
		specify{expect(ticket).to respond_to(:organization_id)}
		specify{expect(ticket).to respond_to(:name)}
  end


  describe 'relationships' do

	  it "belongs to region" do
	  	expect(ticket).to belong_to(:region)
	  end
	  it "belongs to resource category" do
	  	expect(ticket).to belong_to(:resource_category)
	  end
	  it "belongs to organization" do
	  	expect(ticket).to belong_to(:organization)
	  end
  end

  describe "validations" do
		it "validates name" do
			expect(ticket).to validate_presence_of(:name)
		end
  	it "validates length of name" do
  		expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
  	end
  	it "validates length of description" do
  		expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
  	end
		#it "validates phone number" do
			#expect(ticket).to validate(:phone).phony_plausible(true)
		#end
	end

	describe "#open" do
	  it "is open ticket" do
			open_tickets = ticket.open?
			expect(ticket.open?).to eq(true)
	  end
	  it "is closed ticket" do
		  ticket.closed = true
		  expect(ticket.open?).to eq(false)
	  end
	end

	describe "#captured" do
		it "ticket is not captured if it has no organiztion" do
			expect(ticket).to_not be_captured
		end
		it "ticket is captured if it has an organzation" do
			ticket.organization = organization
			expect(ticket).to be_captured
		end
	end

  describe "#to_s" do
   	it "has a string representation that is a ticket id" do
		ticket.id = 123
		expect(ticket.to_s).to eq("Ticket 123")
		end
  end

end
