class AdminController < ApplicationController
  before_action :authorize_admin

  def upload_substances_csv
    ::Admin::Substances::UploadCSV.new(params: substance_params).call

    redirect_to substances_path, notice: 'Substancje zaktualizowane!'
  end

  private

  def substance_params
    params.require(:substances).permit(:file, :status)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Ta część aplikacji jest dostępna tylko dla administratora' unless current_user&.admin?
  end
end