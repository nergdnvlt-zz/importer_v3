class Subscription < ApplicationRecord
  include FormatDate

  validates_presence_of   :reference_id, :first, :last, :email, :language, :country, 
                          :live, :account_id, :product_path, :quantity, :currency,
                          :list_price, :interval, :interval_length,  :site_id,
                          :next_charge_date

  validates_inclusion_of  :manual_renew, in: [true, false]

  belongs_to :company
end
