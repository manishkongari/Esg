class Project < ActiveRecord::Base
  has_many :components
  belongs_to :user
  validates :projectname,:priority,:contract,:salescontact,:engineer,:podate,:buildready,:qcdate,:shipdate,:mtdr,:quicknote,
             presence: true
end
