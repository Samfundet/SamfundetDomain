class GroupType < ApplicationRecord
  has_many :groups, :order => 'name'

  validates_presence_of :description, :priority

  default_scope { order(priority: :desc) }

  def <=>(other)
    priority <=> other.priority
  end

  def to_s
    description
  end
end
