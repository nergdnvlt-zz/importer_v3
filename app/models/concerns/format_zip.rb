module FormatZip
    def format_zip
        return uval_us_zip if country == "US"
    end

    def uval_us_zip
        if postal_code.length == 3
            self.postal_code = "00" + postal_code
        end
    end
end