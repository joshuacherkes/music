class User < ActiveRecord::Base
  attr_accessible :email, :password, :token, :admin, :activation

  has_many :notes, :dependent => :destroy

  before_save :defaults

  def defaults
    self.admin ||= 0
  end

end
