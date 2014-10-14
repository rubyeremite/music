class GenreLanguage < ActiveRecord::Base
  has_many :genre_types
  #has_many :ablums #, :through=> :genre_types
  validates_presence_of :genrename
  validates_uniqueness_of :genrename
  #default_scope  { order('genrename ') }
  def to_s
    genrename
  end

end
