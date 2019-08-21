class MedicamentsController < ApplicationController
  before_action :authorize_medicament, only: %i[create update edit new destroy]

  expose :medicaments, :medicaments_kind
  expose :medicament

  def index
    respond_to do |format|
      format.html
      format.json { render json: MedicamentDatatable.new(params, view_context: view_context) }
    end
  end

  def create
    if medicament.save
      redirect_to medicament_path(medicament)
    else
      render :new
    end
  end

  def update
    if medicament.update(medicament_params)
      redirect_to medicament_path(medicament)
    else
      render :edit
    end
  end

  def destroy
    medicament.destroy
    redirect_to medicaments_path
  end

  private

  def authorize_medicament
    authorize medicament
  end

  def medicament_params
    params.require(:medicament).permit(:name, :status, medicament_group_ids: [])
  end

  def medicaments_kind
    return Medicament.ordinable if params[:kind] == 'ordinable'
    return Medicament.pursued if params[:kind] == 'pursued'

    Medicament.all
  end
end
