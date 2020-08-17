module ValidateZip
    def validate_zip
        if ZipCode.find_by(postal_code: postal_code).nil?
            return self.postal_code = nil if ZipCodeService.run(postal_code) == 404
        end     
    end
end