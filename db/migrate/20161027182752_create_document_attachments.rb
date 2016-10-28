class CreateDocumentAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :document_attachments do |t|
      t.string :file
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
