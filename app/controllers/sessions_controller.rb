class SessionsController < ApplicationController
  def create
    company = Company.find_by(name: company_params[:name])
    if company
      session[:company_id] = company.id
      redirect_to "/#{company.name}"
    else
      redirect_to new_company_path
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
