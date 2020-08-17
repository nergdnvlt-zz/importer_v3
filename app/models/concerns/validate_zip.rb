module ValidateZip
    def validate_zip
        return postal_code if ZipCode.find_by(postal_code: postal_code)
    end
end