class AdminController < ApplicationController
  before_action :authorize_admin

  def upload_substances_csv
    ::Admin::Substances::UploadCSV.new(params: drugs_params).call

    redirect_to substances_path, notice: 'Substancje zaktualizowane!'
  end

  def upload_drugs_csv
    ::Admin::Medicaments::UploadCSV.new(params: drugs_params).call

    redirect_to medicaments_path, notice: 'Leki zaktualizowane!'
  end

  private

  def drugs_params
    params.require(:drugs).permit(:file, :status)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Ta część aplikacji jest dostępna tylko dla administratora' unless current_user&.admin?
  end
end