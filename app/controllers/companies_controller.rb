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
    read(params[:csv_file]).each do |sub|
      SubCreationService.sub_eval_and_create(@company.id, sub)
    end
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
    CSV.foreach(filepath, headers: :true, header_converters: :symbol).map{ |row| row }
  end
end
