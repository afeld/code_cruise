class RelationshipsController < ApplicationController
  before_action :new_relationship, only: :create
  before_action :set_relationship, only: :destroy

  # POST /relationships
  # POST /relationships.json
  def create
    respond_to do |format|
      if @relationship.save
        format.html { redirect_to @relationship, notice: 'Relationship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @relationship }
      else
        format.html { redirect_to admin_path }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to relationships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def new_relationship
      @relationship = Relationship.new(relationship_params)
    end

    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.fetch(:relationship, {}).permit(:parent_id, :child_id)
    end
end
