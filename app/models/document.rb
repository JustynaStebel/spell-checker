class Document < ApplicationRecord
  belongs_to :user
  has_many :document_attachments
  accepts_nested_attributes_for :document_attachments
end
