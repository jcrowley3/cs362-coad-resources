require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
    context "organization user" do
        describe 'POST #create' do
            let(:user) do
                User.create(email: 'fakeemail@gmail.com', password: 'password',password_confirmation: 'password', role: 'organization')
            end
            before do
                user.confirm 
                sign_in(user)
            end
            it 'succeeds'do
                expect(post(:create, params: {organization: {name: 'Fake'}})).to redirect_to(organization_application_submitted_path)
            end
        end
    end
end
