class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name , limit: 100
      t.integer :year
      t.string :image
      t.references :genre_type, index: true
      t.references :genre_language, index: true
      t.timestamps
    end
    add_index :albums, :album_name
  end
end
