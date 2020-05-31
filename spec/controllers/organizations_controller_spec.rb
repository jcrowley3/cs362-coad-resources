require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

    class FakeMailer
        def new_organization_application
            false
        end
    end 

    context "as user" do
        let (:user) {create(:user, role: "organization")}
        let (:admin_user) {create(:user, :admin)}
        let (:organization) {create(:organization)}
    
        before do
            sign_in(user)
        end
               
        describe "#index" do
            it 'succeeds' do
                allow(UserMailer).to receive(:with).and_return(FakeMailer.new)
                expect(post(:create, params: { id: organization.id, organization: {create_reason: 'FAKE'} } )).to_not redirect_to("/dashboard")
            end
        end

        describe "#approve" do
            it 'succeeds' do
                expect(post(:approve, params: { id: organization.id, organization: {approve_reason: 'FAKE'}})).to redirect_to("/dashboard")
            end
        end

        describe "#reject" do
            it 'succeeds' do
                expect(post(:reject, params: { id: organization.id, organization: {rejection_reason: 'FAKE'}})).to redirect_to("/dashboard")
            end
        end
    end

    context "as admin" do
        let (:user) {create(:user, role: "organization")}
        let (:admin_user) {create(:user, :admin)}
        let (:organization) {create(:organization)}

        before do
            sign_in(admin_user)
        end

        describe "#index" do
            it 'succeeds' do
                allow(UserMailer).to receive(:with).and_return(FakeMailer.new)
                expect(post(:create, params: { id: organization.id, organization: {create_reason: 'FAKE'} } )).to redirect_to('/dashboard')
            end
        end
        describe "#approve" do
            it 'succeeds' do
                expect(post(:approve, params: { id: organization.id, organization: {approve_reason: 'FAKE'}})).to redirect_to("/organizations")
            end
        end
        describe "#reject" do
            it 'succeeds' do
                expect(post(:reject, params: { id: organization.id, organization: {rejection_reason: 'FAKE'}})).to redirect_to("/organizations")
            end
        end
    end
end
