module InvalidSubscriptionsHelper
  def invalid_sample(company)
    company.invalid_subscriptions.limit(10)
  end 
end
