class GenreType < ActiveRecord::Base
  belongs_to :genre_language
  has_many :albums

 validates :genretypename, uniqueness: {scope: :genrelanguage_id}
  def to_s
    genretypename
  end
end
