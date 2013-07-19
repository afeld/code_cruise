class AlternateTitle < ActiveRecord::Base
  validates :title, presence: true
  validates :topic, presence: true

  belongs_to :topic
end
