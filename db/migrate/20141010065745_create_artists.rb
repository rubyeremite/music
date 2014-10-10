class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :image
      t.references :category, index: true
      t.timestamps
    end    
    
    #execute "ALTER TABLE artists ADD PRIMARY KEY (artist_name,category_id);"
    # add_column :artists, :id, :integer    ,:auto_increment=>1, :default => 1
   # add_index :artists,  :id, unique: true
    

  end

end
