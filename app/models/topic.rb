class Topic < ActiveRecord::Base
  has_many :parent_relationships, class_name: 'Relationship', foreign_key: :child_id
  has_many :parents, through: :parent_relationships

  has_many :child_relationships, class_name: 'Relationship', foreign_key: :parent_id
  has_many :children, through: :child_relationships
end
