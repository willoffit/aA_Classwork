require 'rails_helper'

# test for create, new, destroy

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do 
      it "will redirect to new_session_url" do
        post :create, params: { user: { email: "a@b.com", password: "abc" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do 
      it "will redirect to user's show page" do
        post :create, params: { user: { email: "a@b.com", password: "abcdefg" } }
        expect(response).to redirect_to(session_url)
      end
    end
  end

  describe "GET #new" do
    it "will redirect to the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end

