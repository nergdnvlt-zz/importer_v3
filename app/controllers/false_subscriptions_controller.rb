class FalseSubscriptionsController < ApplicationController
  before_action :set_company, only: %i[index destroy]
  
  def index
    @subs = @company.false_subscriptions
    respond_to do |format|
      format.html
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=#{@company.name}-invalid-subs.csv"
      end
    end
  end
  
  def destroy
    if @company.subscriptions.destroy_all
      redirect_to company_path(@company)
    else
      redirect_to company_subscriptions_path(@company)
    end
  end

  private

  def set_company
    @company = Company.find_by(name: params[:company_id])
  end
end
