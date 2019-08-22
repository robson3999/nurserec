class SubstancesController < ApplicationController
  before_action :authorize_substance, only: %i[create update edit new destroy]

  expose :substance
  expose :substances, -> { Substance.all }

   def index
    respond_to do |format|
      format.html
      format.json { render json: SubstanceDatatable.new(params, view_context: view_context) }
    end
  end

  def create
    if substance.save
      redirect_to substance_path(substance)
    else
      render :new
    end
  end

  def update
    if substance.update(substance_params)
      redirect_to substance_path(substance)
    else
      render :edit
    end
  end

  def destroy
    substance.destroy
    redirect_to substances_path
  end

  private

  def authorize_substance
    authorize substance
  end

  def substance_params
    params.require(:substance).permit(:name, :status, medicament_ids: [], medicament_group_ids: [])
  end
end