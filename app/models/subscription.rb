class Subscription < ApplicationRecord
    include FormatZip
    include ValidateZip

    validates_presence_of   :reference_id, :first, :last, :email, :language, :country, 
                            :postal_code, :live, :account_id, :product_path, :quantity, 
                            :currency, :list_price, :interval, :interval_length, 
                            :next_charge_date, :site_id
    
    validates_inclusion_of  :manual_renew, in: [true, false]

    before_create   :format_zip,
                    :validate_zip
end
