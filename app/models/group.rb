class Group < ActiveRecord::Base
  belongs_to :group_type

  validates_presence_of :name, :group_type, :short_description, :short_description
  validates_associated :group_type

  def <=>(other)
    name <=> other.name
  end

  def short_name
    unless abbreviation.blank?
      abbreviation
    else
      name
    end
  end

  def to_s
    if abbreviation.blank?
      name
    else
      "#{name} (#{abbreviation})"
    end
  end

  def to_param
    if short_name.nil?
      super
    else
      "#{id}-#{short_name.parameterize}"
    end
  end

  def group_leader_role
    "#{short_name.downcase}_gjengsjef".gsub(" ", "_").gsub(/[^a-zA-Z_0-9]/, "").to_sym
  end
end
