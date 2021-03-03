class SessionsController < ApplicationController
  def create
    company = Company.find_by(name: company_params[:name])
    if company
      redirect_to "/#{company.name}"
    else
      flash[:notice] = "#{company_params[:name]} does not exist. Please create a company"
      redirect_to new_company_path
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
