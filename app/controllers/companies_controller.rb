require 'facets/string'

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show upload]

  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    if company.save
      session[:company_id] = company.id
      redirect_to "/#{company.name}"
    else
      redirect_to new_company_path
    end
  end

  def show
    @company
  end

  def upload
    UploadService.batch_upload(@company, read(params[:csv_file]))

    redirect_to "/#{@company.name}"
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(session[:company_id]) || @company = Company.find_by(name: params[:company])
  end

  def read(filepath)
    CSV.foreach(
      filepath, 
      headers: :true, 
      header_converters: lambda { |h| h.snakecase.to_sym })
    .map{ |row| row.to_hash }
  end
end
