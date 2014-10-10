ActiveAdmin.register Category do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :category_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
config.per_page = 5
controller do
   def create
     create! do |format|
        format.html { redirect_to admin_categories_url }
      end
   end
 end
end
