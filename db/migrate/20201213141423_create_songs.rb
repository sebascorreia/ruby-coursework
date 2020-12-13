class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.belongs_to :album,index: true, foreign_key: true, null: false
      t.string :name, null:false
      t.text :lyrics
      t.integer :minutes
      t.integer :seconds

      t.timestamps null: false
    end
  end
end
