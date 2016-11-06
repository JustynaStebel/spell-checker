require 'rails_helper'

RSpec.describe Admin::DictionariesController, type: :controller do

  let(:dictionary) { create(:dictionary) }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: dictionary.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, id: dictionary.id
      expect(response).to render_template("show")
    end
  end
end
