require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
    context "unsigned user" do
        let(:unsigned_in_user){create(:user)}
        
        describe '#index' do
            specify {expect(get(:index)).to redirect_to(new_user_session_path)}
        end
        describe "#show" do
            specify {expect(get(:show, params: {:id => 1})).to redirect_to(new_user_session_path)}
        end
        describe "#new" do
            specify {expect(get(:new)).to redirect_to(new_user_session_path)}
        end
        describe "#create" do
            specify {expect(get(:create, params: {:id => 1})).to redirect_to(new_user_session_path)}
        end
        describe "#edit" do
            specify {expect(get(:edit, params: {:id => 1})).to redirect_to(new_user_session_path)}
        end
        describe "#update" do
            specify {expect(get(:update, params: {:id => 1})).to redirect_to(new_user_session_path)}
        end
        describe "#destroy" do
            specify {expect(get(:destroy, params: {:id => 1})).to redirect_to(new_user_session_path)}
        end
    end

    context 'organization user' do
        let (:org_user) {create(:user, role: "organization")}

        before(:each) do
            org_user.confirm
            sign_in(org_user)
        end

        describe "#index" do
            specify {expect(get(:index)).to redirect_to(dashboard_path)}
        end
        describe '#new' do
            specify {expect(get(:new)).to redirect_to(dashboard_path)}
        end
        describe "#show" do
            specify {expect(get(:show, params: {:id => 1})).to redirect_to(dashboard_path)}
        end
        describe "#create" do
            specify {expect(get(:create, params: {:id => 1})).to redirect_to(dashboard_path)}
        end
        describe "#edit" do
            specify {expect(get(:edit, params: {:id => 1})).to redirect_to(dashboard_path)}
        end
        describe "#update" do
            specify {expect(get(:update, params: {:id => 1})).to redirect_to(dashboard_path)}
        end
        describe "#destroy" do
            specify {expect(get(:destroy, params: {:id => 1})).to redirect_to(dashboard_path)}
        end
    end

    context "as admin" do
        let (:admin_user) {create(:user, :admin)}
        let (:organization) {create(:organization)}

        before(:each) do
            sign_in(admin_user)
        end

        #describe "#index" do
        #    specify {expect(get(:index)).to redirect_to(user_session_path)}
        #end
        #describe '#new' do
        #    specify {expect(get(:new)).to redirect_to(user_session_path)}
        #end
        #describe "#show" do
        #    specify {expect(get(:show)).to redirect_to(user_session_path)}
        #end
        #describe "#create" do
        #    specify {expect(get(:create, params: {:id => 1})).to redirect_to(user_session_path)}
        #end
        #describe "#edit" do
        #    specify {expect(get(:edit, params: {:id => 1})).to redirect_to(user_session_path)}
        #end
        #describe "#update" do
        #    specify {expect(get(:update, params: {:id => 1})).to redirect_to(user_session_path)}
        #end
        #describe "#destroy" do
        #    specify {expect(get(:destroy)).to redirect_to(resource_categories_path)}
        #end
    end
end
