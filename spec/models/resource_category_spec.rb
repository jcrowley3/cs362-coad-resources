require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:resource_category){ResourceCategory.new(name: 'FAKE')}

    describe "relationships" do
        it "has many tickets" do
          expect(resource_category).to have_many(:tickets)
        end
        #it "has and belongs to many organizations" do
        #    expect(resource_category).to  has_and_belongs_to_many(:organizations)
        #end
      end

    describe "validations" do
        it "validates presence of name" do
            expect(resource_category).to validate_presence_of(:name)
        end
        it "validates length of name" do
            expect(resource_category).to validate_length_of(:name)
        end
        it "validates uniqueness of name" do
            expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
        end
    end

    describe "functions" do
        it "#to_s" do
            expected_name = 'FAKE'
            expect(resource_category.to_s).to eq(expected_name)
        end

        it "#inactive? false" do
            resource_category.activate
            expect(resource_category.inactive?).to eq(false)
        end
        it "#inactive? true" do
            resource_category.deactivate
            expect(resource_category.inactive?).to eq(true)
        end
    end

end
