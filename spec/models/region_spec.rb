require 'rails_helper'

RSpec.describe Region, type: :model do

    let(:region) {Region.new(name: 'FAKE') }

    describe "attributes" do
      it "has a name" do 
        expect(region).to respond_to(:name)
      end
    end

    describe "relationships" do
      it "has many tickets" do
        expect(region).to have_many(:tickets)
      end
    end

    describe "validations" do
      it "validates name" do
        expect(region).to validate_presence_of(:name)
      end
      it "validates length of name" do
        expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
      end
      it "validates uniqueness of name" do
        expect(region).to validate_uniqueness_of(:name).case_insensitive
      end
    end

    describe "functions" do
      it "has a string representation that is a name" do
          expected_name = 'FAKE'
          expect(region.to_s).to eq(expected_name)
      end
  end



end
