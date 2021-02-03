module UsZipService
  def validate_us_postal_code(country, postal_code)
    if country == 'US'
      return "INVALID" if postal_code.nil?

      postal_code = validate_zip(eval_zip(postal_code))
    end

    postal_code
  end

  def eval_zip(incoming_zip)
    if incoming_zip.length == 5
      return incoming_zip
    elsif incoming_zip.length == 3
      return '00' + incoming_zip
    elsif incoming_zip.length == 4
      return '0' + incoming_zip
    elsif incoming_zip.length > 5
      eval_zip_suffix(incoming_zip)
    end
  end

  def eval_zip_suffix(zip)
    if zip.include?('-')
      zip[0..4].to_s
    else
      zip
    end
  end

  def validate_zip(postal_code)
    if real_zip?(postal_code) == false
      return "#{postal_code}-INVALID"
    end

    postal_code
  end

  def real_zip?(postal_code)
    return true if @zips.include?(postal_code)

    false 
  end
end