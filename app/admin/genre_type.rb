ActiveAdmin.register GenreType do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :genretypename,:genrelanguage_id, :genrename
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

   config.per_page = 10
   config.sort_order = "genretypename_asc"



   index do
     column :id
     column :genretypename
     column :genre_language
     actions
   end

  #after create record, redirect to index page
   controller do
     def create
       create! do |format|
         format.html { redirect_to admin_genre_types_url }
       end
     end
   end

end
