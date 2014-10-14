ActiveAdmin.register Album do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_resource_params :album_name, :year, :image, :genre_type_id, :genre_language_id

  permit_params :album_name, :year, :image, :genre_type_id, :genre_language_id
  #params.require(:album).permit(:album_name, :year, :image, :genre_type_id, :genre_language_id)

  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :album_name
    column :year
    column :genre_type
    column :genre_language
    column "Image" do |event|
      link_to(image_tag(event.image.url(:thumb), :height => '80'), [:admin, event])
    end
    actions
  end


# #New form
#   form :html => { :enctype => "multipart/form-data" } do |f|
#     f.inputs 'Album Details' do
#       f.input :genre_language_id, :label => 'Language', :as => :select, :collection => (GenreLanguage.select(:id,:genrename)), :include_blank => true,prompt:"choose Language"
# #all).order
#
#       f.input :genre_type_id, :label => 'Type', :as => :select, :collection => (GenreType.all).order(:genretypename), :include_blank => true, prompt: "choose Type"
#       f.input :album_name, :label => "Album Name"
#       f.input :year, as: :select, collection: Date.today.year.downto(1960), prompt: "choose year" ,:label => "Release Year"
#       f.input :image, :label => 'Album image', :as => :file
#       # f.grouped_collection_select :state_id, Country.order(:name), :states, :name, :id, :name, include_blank: true
#       # f.input :genre_type_id,  :as => :select, :grouped_collection => (GenreType.all).order(:genretypename), :include_blank => true
#
#
#     end
#     f.actions
#   end


  controller do
    #AFter create new record, will navigate to index page.
    def create
      create! do |format|
        format.html { redirect_to admin_albums_url }
      end
    end
  end
#new
  controller do
     def new
          @album = Album.new
          @genre_language = GenreLanguage.pluck(:id,:genrename)
          #@genre_type = GenreType.pluck(:id, :genretypename)
           render 'new'# layout: false

     end
  end
  #----------------------

  # def index
  #   @genrelanguages = GenreLanguage.all
  #   @genretypes = GenreType.all
  #   @album =Album.all
  # end
  # def update_genre_types
  #   genre = GenreLanguage.find(params[:id])
  #   @genretypes = genre.genre_types.map{|a|[a.genretypename,a.id]}.insert(0,"select Type")
  #   @album = genre.album.map{|s|[s.album_name, s.id]}.insert(0,"select Album")
  # end
  # def update_albums
  #   genretype = GenreType.find(params[:id])
  #   @songs = artist.songs.map{|s|[s.name,s.id]}.insert("select a song")
  # end

  #---------------------
  ##show page
  show do |ad|
    attributes_table do
      row :album_name
      row :year
      row :genre_type
      row :genre_language
      #row :image do
      row :image do
        image_tag(ad.image.url, :height => '300',:class =>"fancybox")
      end
    end
    strong { link_to "Index Pages", admin_albums_url }
  end
end


