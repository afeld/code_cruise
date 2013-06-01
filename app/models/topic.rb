class Topic < ActiveRecord::Base
  has_many :parent_relationships, class_name: 'Relationship', foreign_key: :child_id
  has_many :parents, through: :parent_relationships
end
