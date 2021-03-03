require 'facets/string'

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show upload destroy]
  before_action :authenticate_user!, only: %i[index]

  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    if company.save
      flash[:notice] = "#{company.name} created"
      redirect_to "/#{company.name}"
    else
      flash[:notice] = "#Company not created"
      redirect_to new_company_path
    end
  end

  def show
    @corp = CompanyPresenter.new(@company)
  end

  def upload
    UploadService.batch_upload(@company, read(params[:csv_file]))

    redirect_to "/#{@company.name}"
  end

  def index
    @companies = Company.all
  end

  def destroy
    name = @company.name
    if @company.delete
      flash[:notice] = "#{name} deleted"
    else
      flash[:notice] = "#{@company.name} not deleted"
    end
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

  def set_company
    if params[:company]
      @company = Company.find_by(name: params[:company])
    else
      @company = Company.find_by(name: params[:id])
    end
  end

  def read(filepath)
    CSV.foreach(
      filepath,
      headers: true,
      force_quotes: true,
      header_converters: ->(h) { h.snakecase.to_sym }
    ).map{ |row| row.to_hash }
  end
end
