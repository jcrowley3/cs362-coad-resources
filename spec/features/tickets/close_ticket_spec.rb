require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
    let(:user) { create(:user, :admin)}

    before :each do
        log_in_as(user)
    end

    context 'close ticket as admin' do
        it 'successful' do
            visit '/tickets/1'
            click_on 'Close'
            expect(current_path).to eq '/dashboard'
        end
    end

end
