ActiveAdmin.register GenreLanguage do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :genrename
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
   config.per_page = 10
   config.sort_order = "genrename_asc"

#after create record, redirect to index page
   controller do
     def create
       create! do |format|
         format.html { redirect_to admin_genre_languages_url }
       end
     end
   end

   # scope :by_name do |names|
   #   names.order('genrename asc')
   # end
end
