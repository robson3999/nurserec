class MedicamentsController < ApplicationController
  expose :medicaments, :medicaments_kind
  expose :medicament

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

  def medicament_params
    params.require(:medicament).permit(:name, :status, :medicament_group)
  end

  def medicaments_kind
    return Medicament.ordinable if params[:kind] == 'ordinable'
    return Medicament.pursued if params[:kind] == 'pursued'

    Medicament.all
  end
end
