class CreateDictionaries < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionaries do |t|
      t.text :words, array: true, default: []

      t.timestamps
    end
  end
end
