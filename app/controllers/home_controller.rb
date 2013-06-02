class HomeController < ApplicationController
  def index
    gon.push(
      relationships: Relationship.all,
      topics: Topic.all
    )
  end
end
