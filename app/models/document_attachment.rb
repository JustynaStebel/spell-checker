class DocumentAttachment < ApplicationRecord
  belongs_to :document
  mount_uploader :file, FileUploader
end
