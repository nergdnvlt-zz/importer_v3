module UsZipService
  def us_zips
    format_zips

    validate_zips
  end

  def format_zips
    @subs.each do |sub|
      if sub[:country] == 'US'
        sub[:postal_code] = eval_zip(sub[:postal_code])
      end
    end
  end

  def eval_zip(incoming_zip)
    # Remove after Roland
    return '93101' if incoming_zip.nil?

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

  def validate_zips
    @subs.select! do |sub|
      result = real_zip?(sub[:country], sub[:postal_code])
      @invalid_subs << sub if result == false
      
      sub if result == true
    end
  end

  def real_zip?(country, zip)
    return true if country != 'US'
    return true if @zips.include?(zip)

    false 
  end
end