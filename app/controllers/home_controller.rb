class HomeController < ApplicationController
  def index
    @topics = Topic.all
    gon.push(
      relationships: Relationship.all,
      topics: @topics
    )
  end
end
