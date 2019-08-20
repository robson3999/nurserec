class MedicamentGroupsController < ApplicationController
  expose :medicament_groups, -> { MedicamentGroup.all }
  expose :medicament_group
  expose :medicaments, -> { medicament_group.medicaments }

  def create
    if medicament_group.save
      redirect_to medicament_group_path(medicament_group)
    else
      render :new
    end
  end

  def update
    if medicament_group.update(medicament_params)
      redirect_to medicament_group_path(medicament_group)
    else
      render :edit
    end
  end

  def destroy
    medicament_group.destroy
    redirect_to medicaments_path
  end

  private

  def medicament_group_params
    params.require(:medicament_group).permit(:name)
  end
end
