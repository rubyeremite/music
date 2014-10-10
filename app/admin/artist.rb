ActiveAdmin.register Artist do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :category_name, :artist_name, :category_id,:image
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
 config.per_page = 10
 config.sort_order = "artist_name_asc"
  index   do
   column :id
   column :artist_name
   column :category , sortable:  :category
   column "Image" do |event|
    link_to(image_tag(event.image.url(:thumb), :height => '80'), [:admin, event])
  end   
   actions
end

#show form

form :html => { :enctype => "multipart/form-data" } do |f|
f.inputs 'Details' do         
   f.input :category_id, :label => 'Artist Type', :as => :select, :collection => (Category.all).order(:category_name), :include_blank => true        
   f.input :artist_name, :label => "Artist Name"
   f.input :image, :label => 'Post image', :as => :file
end
f.actions
end


controller do
   def create
     create! do |format|
        format.html { redirect_to admin_artists_url }
      end
   end
 end

  show do |ad|    
      attributes_table do        
        row :artist_name
        row :image do
          #image_tag(ad.image.url, :height => '300')  
          link_to :artist_name, ad.image.url, :class =>"fancybox"        
        end
"srnivas"
        link_to admin_artists_url
      end
end

end
