require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  let(:valid_attributes) do
    FactoryBot.build(:event).attributes
  end

  let(:invalid_attributes) do
    { }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    let!(:event) { Event.create! valid_attributes }

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let!(:event) { Event.create! valid_attributes }

    it "returns a success response" do
      get :show, params: {id: event.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: {event: valid_attributes}, session: valid_session
        }.to change(Event, :count).by(1)
      end

      it "renders a JSON response with the new event" do
        post :create, params: {event: valid_attributes}, session: valid_session

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(event_url(Event.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new event" do
        post :create, params: {event: invalid_attributes}, session: valid_session

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    let!(:event) { Event.create! valid_attributes }

    context "with valid params" do  
      let(:new_attributes) { { name: "a new name" } }

      it "updates the requested event" do        
        put :update, params: {id: event.to_param, event: new_attributes}, session: valid_session
        event.reload

        expect(event.name).to eq "a new name"
      end

      it "renders a JSON response with the event" do
        put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the event" do
        put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:event) { Event.create! valid_attributes }

    it "destroys the requested event" do
      expect {
        delete :destroy, params: {id: event.to_param}, session: valid_session
      }.to change(Event, :count).by(-1)
    end
  end
end
