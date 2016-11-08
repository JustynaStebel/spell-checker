require 'rails_helper'

RSpec.describe IncorrectWord, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :document_attachment }
  end
end
