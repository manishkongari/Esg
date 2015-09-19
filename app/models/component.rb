class Component < ActiveRecord::Base
  has_many :component_types
  belongs_to :project
end
