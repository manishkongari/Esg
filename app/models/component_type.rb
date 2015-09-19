class ComponentType < ActiveRecord::Base
  has_many :components
  validates :name, uniqueness: true
end
