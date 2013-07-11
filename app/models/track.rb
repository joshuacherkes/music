class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :ord, :lyrics

  validates :album_id, :name, :ord, :presence => true

  belongs_to :album

  has_one :band, :through => :album

  has_many :notes, :dependent => :destroy
end
