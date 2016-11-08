require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'PUT #update' do
    let!(:user) { create :user, email: 'user@gmail.com', password: 'pass123' }
    let(:email) { 'user111@gmail.com' }
    let!(:params) do
      { id: user.id, user: { email: email } }
    end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to user_path(user) }

      context 'updates user' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ user.reload.email }.to(email) }
      end
    end
  end
end
