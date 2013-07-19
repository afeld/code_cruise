class Resource < ActiveRecord::Base
  belongs_to :topic

  validate :topic_id, presence: true
  validate :url, presence: true, uniqueness: { scope: :topic_id }


  def display_title
    self.title.presence || self.url
  end
end
