class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.belongs_to :band, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :year

      t.timestamps null: false
    end
  end
end
