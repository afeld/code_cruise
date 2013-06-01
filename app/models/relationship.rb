class Relationship < ActiveRecord::Base
  belongs_to :parent, class_name: 'Topic'
  belongs_to :child, class_name: 'Topic'

  validates :parent_id, presence: true
  validates :child_id, presence: true, uniqueness: { scope: :parent_id }
end
