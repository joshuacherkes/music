class Band < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :albums
  has_many :tracks,  :through => :albums
end
