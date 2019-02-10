require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.build(:user).attributes
  }

  let(:invalid_attributes) {
    { }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    let!(:user) { User.create! valid_attributes }

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let!(:user) { User.create! valid_attributes }

    it "returns a success response" do
      get :show, params: {id: user.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post :create, params: {user: valid_attributes}, session: valid_session

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do

        post :create, params: {user: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    let!(:user) { User.create! valid_attributes }

    context "with valid params" do
      let(:new_attributes) {
        { name: "a new name" }
      }

      it "updates the requested user" do
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        expect(user.name).to eq "a new name"
      end

      it "renders a JSON response with the user" do
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { User.create! valid_attributes }

    it "destroys the requested user" do
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end
  end

end
