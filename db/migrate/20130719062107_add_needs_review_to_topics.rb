class AddNeedsReviewToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :needs_review, :boolean
  end
end
