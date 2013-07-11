class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :ord

  validates :album_id, :name, :ord, :presence => true

  belongs_to :album, :dependent => :destroy

  belongs_to :band, :through => :album
end
