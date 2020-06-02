require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
	let(:admin) {create(:user, :admin) }
	let(:ticket) {create(:ticket) }

	before :each do
			log_in_as(admin)
	end

	context 'admin user' do
		it "deletes a ticket" do
			visit ticket_path(ticket)
			click_on "Delete"
			expect(page).to have_content("was deleted")
		end
	end
end
