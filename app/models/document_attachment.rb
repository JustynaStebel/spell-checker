class DocumentAttachment < ApplicationRecord
  belongs_to :document
  has_many :incorrect_words, dependent: :destroy
  mount_uploader :file, FileUploader
end
