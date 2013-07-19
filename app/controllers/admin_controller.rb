class AdminController < ApplicationController
  before_action :new_relationship

  # GET /admin
  def show
    @relationships = Relationship.all.order('created_at DESC')
    @topics = Topic.order('title')
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def new_relationship
    @relationship = Relationship.new(relationship_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def relationship_params
    params.fetch(:relationship, {}).permit(:parent_id, :child_id)
  end
end
