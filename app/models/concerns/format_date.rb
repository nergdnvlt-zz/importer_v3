module FormatDate
    def format_next_charge_date
        return self.next_charge_date = nil if self.next_charge_date.nil?

        self.next_charge_date = next_charge_date.to_date
    end

    def format_begin_date
        return self.begin_date = nil if self.begin_date.nil?

        self.begin_date = begin_date.to_date
    end
    
    def format_end_date
        return self.end_date = nil if self.end_date.nil?
        
        self.end_date = end_date.to_date 
    end

    def format_trial_date
        return self.trial_end_date = nil if self.trial_end_date.nil?

        self.trial_end_date = trial_end_date.to_date
    end
end