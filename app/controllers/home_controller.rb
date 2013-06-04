class HomeController < ApplicationController
  skip_before_filter :must_be_local

  def index
    @topics = Topic.all
    gon.push(
      relationships: Relationship.all,
      topics: @topics
    )
  end
end
