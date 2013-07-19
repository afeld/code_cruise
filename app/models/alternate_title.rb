class AlternateTitle < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :topic
end
