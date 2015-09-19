class Component < ActiveRecord::Base
  belongs_to :component_type
  belongs_to :project

end
