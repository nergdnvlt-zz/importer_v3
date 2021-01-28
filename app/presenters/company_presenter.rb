class CompanyPresenter
  attr_reader :company, :subs, :invalid_subs
  def initialize(company)
    @company = company
    @subs = company.subscriptions.all
    @invalid_subs = company.invalid_subscriptions.all
  end

end