class Area < ActiveRecord::Base
  #attr_accessible :name, :description

  validates_presence_of :name

  def to_s
    name
  end
end
