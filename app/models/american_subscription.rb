class AmericanSubscription < Subscription
  include FormatZip
  include ValidateZip

  validates_presence_of :postal_code

  before_validation :format_zip,
                    :validate_zip
end
