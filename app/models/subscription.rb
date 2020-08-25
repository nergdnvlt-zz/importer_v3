class Subscription < ApplicationRecord
    validates_presence_of   :reference_id, :first, :last, :email, :language, :country, 
                            :live, :account_id, :product_path, :quantity, :currency,
                            :list_price, :interval, :interval_length,  :site_id,
                            :next_charge_date
    
    validates_inclusion_of  :manual_renew, in: [true, false]

    def next_charge_date
        return self.next_charge_date = nil if read_attribute(:next_charge_date).nil?

        read_attribute(:next_charge_date).strftime("%F")
    end

    def trial_end_date
        return self.trial_end_date = nil if read_attribute(:trial_end_date).nil?

        read_attribute(:trial_end_date).strftime("%F")
    end

    def begin_date
        return self.begin_date = nil if read_attribute(:begin_date).nil?

        read_attribute(:begin_date).strftime("%F")
    end

    def end_date
        return self.end_date = nil if read_attribute(:end_date).nil?

        read_attribute(:end_date).strftime("%F")
    end
end
