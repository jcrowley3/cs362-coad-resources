require 'rails_helper'

RSpec.describe Region, type: :model do

    describe "to_s" do
        it "returns valid name" do
            expected_name = 'FAKE'
            expect(expected_name.to_s).to eq.('FAKE')
end
