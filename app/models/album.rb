class Album < ActiveRecord::Base
  attr_accessible :band_id, :name, :release, :env

  validates :band_id, :name, :env, :presence => true
  has_many :tracks, :dependent => :destroy
  belongs_to :band

end
