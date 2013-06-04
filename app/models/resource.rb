class Resource < ActiveRecord::Base
  belongs_to :topic

  validate :topic_id, presence: true
  validate :url, presence: true
end
