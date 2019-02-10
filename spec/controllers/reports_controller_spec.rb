require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  let(:user)  { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment) }

  let(:valid_attributes) do
    FactoryBot.build(:report, user: user, comment: comment).attributes
  end

  let(:invalid_attributes) do
    { }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    let!(:report) { Report.create! valid_attributes }

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let!(:report) { Report.create! valid_attributes }

    it "returns a success response" do
      get :show, params: {id: report.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Report" do
        expect {
          post :create, params: {report: valid_attributes}, session: valid_session
        }.to change(Report, :count).by(1)
      end

      it "renders a JSON response with the new report" do
        post :create, params: {report: valid_attributes}, session: valid_session

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(report_url(Report.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new report" do
        post :create, params: {report: invalid_attributes}, session: valid_session

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    let!(:report) { Report.create! valid_attributes }
    let(:new_user) { FactoryBot.create(:user) }

    context "with valid params" do  
      let(:new_attributes) { { user_id: new_user.id } }

      it "updates the requested report" do        
        put :update, params: {id: report.to_param, report: new_attributes}, session: valid_session
        report.reload

        expect(report.user_id).to eq new_user.id
      end

      it "renders a JSON response with the report" do
        put :update, params: {id: report.to_param, report: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the report" do
        put :update, params: {id: report.to_param, report: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:report) { Report.create! valid_attributes }

    it "destroys the requested report" do
      expect {
        delete :destroy, params: {id: report.to_param}, session: valid_session
      }.to change(Report, :count).by(-1)
    end
  end
end
