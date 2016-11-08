require 'rails_helper'

RSpec.describe DocumentAttachment, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :incorrect_words }
    it { is_expected.to belong_to :document }
  end
end
