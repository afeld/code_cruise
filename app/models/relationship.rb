class Relationship < ActiveRecord::Base
  belongs_to :parent, class_name: 'Topic'
  belongs_to :child, class_name: 'Topic'
end
