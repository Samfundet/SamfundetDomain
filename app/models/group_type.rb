class GroupType < ActiveRecord::Base
  has_many :groups, :order => 'name'

  attr_accessible :description, :priority

  validates_presence_of :description, :priority

  default_scope :order => "priority DESC"

  def <=>(other)
    priority <=> other.priority
  end

  def to_s
    description
  end
end
