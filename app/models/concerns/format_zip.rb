module FormatZip
    def format_zip
        binding.pry
        return eval_us_zip if country == "US"

        self.postal_code = postal_code
    end

    def eval_us_zip
        return postal_code if postal_code.nil?

        binding.pry
        
        if postal_code.length == 5
            self.postal_code = postal_code
        elsif postal_code.length == 3
            self.postal_code = "00" + postal_code
        elsif postal_code.length == 4
            self.postal_code = "0" + postal_code
        elsif postal_code.length > 5
            eval_zip_suffix
        end
    end

    def eval_zip_suffix
        if self.postal_code.include?('-')
            self.postal_code = self.postal_code[0..4].to_s
        else
            self.postal_code = nil
        end
    end
end