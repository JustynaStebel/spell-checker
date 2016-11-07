class CreateIncorrectWords < ActiveRecord::Migration[5.0]
  def change
    create_table :incorrect_words do |t|
      t.text :words, array: true, default: []
      t.references :document_attachment, foreign_key: true

      t.timestamps
    end
  end
end
