class AlternateTitlesController < ApplicationController
  before_action :new_alternate_title, only: :create
  before_action :set_alternate_title, only: :destroy

  # POST /alternate_titles
  # POST /alternate_titles.json
  def create
    respond_to do |format|
      if @alternate_title.save
        format.html { redirect_to topic_url(@alternate_title.topic), notice: 'Alternate Title was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alternate_title }
      else
        format.html { redirect_to admin_path }
        format.json { render json: @alternate_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alternate_titles/1
  # DELETE /alternate_titles/1.json
  def destroy
    @alternate_title.destroy
    respond_to do |format|
      format.html { redirect_to admin_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def new_alternate_title
      @alternate_title = AlternateTitle.new(alternate_title_params)
    end

    def set_alternate_title
      @alternate_title = AlternateTitle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alternate_title_params
      params.fetch(:alternate_title, {}).permit(:title, :topic_id)
    end
end
