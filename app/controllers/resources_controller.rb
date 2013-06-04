class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources/1
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
    @resource.topic = Topic.find(params[:topic_id])
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)
    @resource.topic = Topic.find(params[:topic_id])

    if @resource.save
      redirect_to @resource.topic, notice: 'Resource was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      redirect_to @resource.topic, notice: 'Resource was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resource).permit(:title, :url, :topic_id)
    end
end
