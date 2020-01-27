class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :height
      t.string :url
      t.integer :width
      t.references :album, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
