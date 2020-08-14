class Subscription < ApplicationRecord
    validates_presence_of   :reference_id, :first, :last, :email, :language, :country, 
                            :postal_code, :live, :account_id, :product_path, :quantity, 
                            :currency, :list_price, :interval, :interval_length, 
                            :next_charge_date, :manual_renew, :site_id
end
