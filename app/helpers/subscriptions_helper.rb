module SubscriptionsHelper
  def sample(company)
    company.subscriptions.limit(10)
  end 
end
