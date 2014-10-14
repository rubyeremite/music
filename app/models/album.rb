class Album < ActiveRecord::Base
  belongs_to :genre_type
  belongs_to :genre_language
  validates :album_name, uniqueness: {scope: :genre_type_id}
  validates_presence_of :album_name, :genre_type#,:genre_language
  #attr_accessor :new_genre_type_name
 # before_save :create_genre_type_from_name
  mount_uploader :image, AvatarUploader
  # def create_genre_type_from_name
  #   create_genre_type(:genretypename =>new_genre_type_name) unless new_genre_type_name = blank?
  # end
end
