class CreateGenreTypes < ActiveRecord::Migration
  def change
    create_table :genre_types do |t|
      t.string :GenreTypeName, null: false, limit: 40
      t.integer :genre_language_id
      #t.references :GenreLanguage, index: true

      t.timestamps
    end
  end
end
