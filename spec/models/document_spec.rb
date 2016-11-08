require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :document_attachments }
    it { is_expected.to belong_to :user }
  end
  describe 'nested attributes' do
    it { should accept_nested_attributes_for :document_attachments }
  end
end
