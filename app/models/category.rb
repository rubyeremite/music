class Category < ActiveRecord::Base
  has_many :artists
  auto_strip_attributes :category_name, :squish => true, :nullify => false
  default_scope { order( 'category_name') }
  def to_s
    category_name
  end
end
