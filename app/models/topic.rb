class Topic < ActiveRecord::Base
  has_many :alternate_titles, dependent: :destroy

  has_many :parent_relationships, class_name: 'Relationship', foreign_key: :child_id, dependent: :destroy
  has_many :parents, through: :parent_relationships

  has_many :child_relationships, class_name: 'Relationship', foreign_key: :parent_id, dependent: :destroy
  has_many :children, through: :child_relationships

  has_many :resources, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  default_scope { order('title') }


  def other
    self.class.where('id != ?', self.id)
  end
end
