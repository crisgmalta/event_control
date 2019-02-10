require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user)  { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }

  let(:valid_attributes) do
    FactoryBot.build(:comment, user: user, event: event).attributes
  end

  let(:invalid_attributes) do
    { "some_key": "a value" }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    let!(:comment) { Comment.create! valid_attributes }

    it "returns a success response" do  
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let!(:comment) { Comment.create! valid_attributes }

    it "returns a success response" do
      get :show, params: {id: comment.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "renders a JSON response with the new comment" do
        post :create, params: {comment: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(comment_url(Comment.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new comment" do
        post :create, params: {comment: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    let!(:comment) { Comment.create! valid_attributes }

    context "with valid params" do  
      let(:new_attributes) do
        comment.attributes.merge("text" => "new text")
      end

      it "updates the requested comment" do
        put :update, params: {id: comment.to_param, comment: new_attributes}, session: valid_session
        comment.reload
        expect(comment.text).to eq "new text"
      end

      it "renders a JSON response with the comment" do
        put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the comment" do
        put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    let!  (:comment) { Comment.create! valid_attributes }

    it "destroys the requested comment" do
      expect {
        delete :destroy, params: {id: comment.to_param}, session: valid_session
      }.to change(Comment, :count).by(-1)
    end
  end

end
