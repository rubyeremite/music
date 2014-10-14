class CreateGenreLanguages < ActiveRecord::Migration
  def change
    create_table :genre_languages do |t|
      t.string :genrename, null: false, limit: 40

      t.timestamps
    end
    add_index :genre_languages, :genrename, :unique => true
  end
end
