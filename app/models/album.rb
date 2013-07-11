class Album < ActiveRecord::Base
  attr_accessible :band_id, :name, :release

  validates :band_id, :name, :release, :presence => true
  has_many :tracks
  belongs_to :band, :dependent => :destroy

end
