class Document < ApplicationRecord
  belongs_to :user
  has_many :document_attachments, dependent: :destroy
  has_many :incorrect_words, dependent: :destroy
  accepts_nested_attributes_for :document_attachments
end
