FactoryBot.define do
    factory :american_subscription do
      reference_id { Faker::Code.nric }
      first { Faker::Name.first_name }
      last { Faker::Name.last_name }
      email { Faker::Internet.safe_email }
      company { Faker::Company.name }
      phone { Faker::PhoneNumber.phone_number }
      language { "en" }
      country { "US" }
      address_1 { "MyString" }
      address_2 { "MyString" }
      city { "MyString" }
      region { "MyString" }
      postal_code { Faker::Address.zip }
      live { true }
      account_id { Faker::Code.asin }
      product_path { Faker::Appliance.brand.parameterize }
      quantity { 1 }
      currency { Faker::Currency.code }
      list_price { Faker::Commerce.price }
      interval { "Month" }
      interval_length { 1 }
      begin_date { "MyString" }
      trial_end_date { "MyString" }
      next_charge_date { Faker::Date.forward(days: 23) }
      end_date { "" }
      interval_count { 0 }
      tax_exemption { "" }
      manual_renew { false }
      site_id { Faker::Company.ein }
    end
  end
  