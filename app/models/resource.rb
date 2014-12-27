class Resource < ActiveRecord::Base
  belongs_to :topic

  validates :topic_id, presence: true
  validates :url, presence: true, uniqueness: { scope: :topic_id }


  def display_title
    self.title.presence || self.url
  end
end
