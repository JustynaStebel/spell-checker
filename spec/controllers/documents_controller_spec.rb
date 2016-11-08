RSpec.describe DocumentsController do
  let(:user) { create :user }
  let(:document) { create :document, user_id: user.id }

  before { sign_in user }

  describe 'GET #show' do
    subject { get :show, id: document.id }

    it "returns success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    subject { get :index }

    it "returns success" do
      expect(response).to have_http_status(:success)
    end
  end
end
