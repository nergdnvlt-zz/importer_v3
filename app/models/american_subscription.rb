class AmericanSubscription < Subscription
  validates_presence_of :postal_code

  belongs_to :company
end
