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

  #configurations

  #paginations
  config.per_page = 10
  # disable pagination total
  # index :pagination_total => false do
  # end
  #config.filters = false

  #sorting
  config.sort_order = "artist_name_asc"

  #download links
  # hide the links entirely
  index :download_links => false
  # only show a PDF export
  #index :download_links => [:pdf]

  index  :default => true  do
    column :id
    column :artist_name
    column :category , sortable:  :category
    column "Image" do |event|
      link_to(image_tag(event.image.url(:thumb), :height => '80'), [:admin, event])
    end
    actions
  end

  # block

  index :as => :block do |artist|
    div :for => artist do
      h2 auto_link(artist.artist_name)
      div do
         span artist.artist_name
         br
         span artist.category
         br
         span image_tag(artist.image.url(:thumb), :height => '80',:class =>"fancybox")
      end

    end

  end

#blog

  index :as => :blog do

      title :artist_name
      body do |post|
      div post.artist_name
      span image_tag(post.image.url(:thumb), :height => '80',:class =>"fancybox")
    end

  end

  #grid

  index :as => :grid , :columns => 5 do |artist|
    link_to(image_tag(artist.image.url(:thumb),:height => '80'), admin_artist_path(artist))

  end





  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Details' do
      f.input :category_id, :label => 'Artist Type', :as => :select, :collection => (Category.all).order(:category_name), :include_blank => true
      f.input :artist_name, :label => "Artist Name"
      f.input :image, :label => 'Post image', :as => :file
    end
    #actions
    strong { link_to "View All Pages", admin_artists_url }
  end

#redirect to index page
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_artists_url }
      end
    end
  end

##show form
  # show do
  #   render 'form'
  # end
  show do |ad|
    attributes_table do
      row :artist_name
      row :image do
        image_tag(ad.image.url, :height => '300',:class =>"fancybox")
        #link_to :artist_name, ad.image.url, :class =>"fancybox"
      end
    end
    strong { link_to "View Index Page", admin_artists_url}
  end

  #filters

#   filter :artist_name, as: :string
#   filter :created_at, as: :date_range
#   filter :artist_name, as: :check_boxes ,:collection => proc { Artist.all }
 end
