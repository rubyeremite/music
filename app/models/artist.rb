class Artist < ActiveRecord::Base
  belongs_to :category
  auto_strip_attributes :artist_name, :squish => true, :nullify => false
  default_scope { order('artist_name ') }
 # self.primary_keys = :artist_name, :category_id
  validates :artist_name, uniqueness: {scope: :category_id}
  mount_uploader :image, AvatarUploader
end
