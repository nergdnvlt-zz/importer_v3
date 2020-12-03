FactoryBot.define do
  factory :false_subscription do
    reference_id { "MyString" }
    first { "MyString" }
    last { "MyString" }
    email { "MyString" }
    company { "MyString" }
    phone { "MyString" }
    language { "MyString" }
    country { "MyString" }
    address_1 { "MyString" }
    address_2 { "MyString" }
    city { "MyString" }
    region { "MyString" }
    postal_code { "MyString" }
    live { "MyString" }
    account_id { "MyString" }
    product_path { "MyString" }
    quantity { 1 }
    currency { "MyString" }
    list_price { 1.5 }
    interval { "MyString" }
    interval_length { 1 }
    begin_date { "MyString" }
    trial_end_date { "MyString" }
    next_charge_date { "MyString" }
    end_date { "MyString" }
    interval_count { 1 }
    tax_exemption { "MyString" }
    manual_renew { false }
    site_id { "MyString" }
    company { nil }
  end
end
