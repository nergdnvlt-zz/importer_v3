module ZipValidator
  # def validate_zips(am_subs)
  #   am_subs.select! do |sub| 
  #     result = real_zip?(sub[:postalcode])
  #     @invalid_subs << sub if result == false
  #     sub if result == true
  #   end
  # end

  def roland_validate_zips(am_subs)
    am_subs.each do |sub| 
      result = real_zip?(sub[:postal_code])
      sub[:postal_code] = '93101' if result == false
    end
  end

  def real_zip?(zip)
    return true if @zips.include?(zip)

    # NOT USING FOR ROLAND
    # return true if find_zip_externally(zip)[0] == 200

    false 
  end

  def find_zip_externally(zip)
    countries.map do |country|
      conn(country, zip).status
    end.uniq
  end

  # API Request
  def conn(country, postal_code)
    Faraday.get("http://api.zippopotam.us/#{country}/#{@postal_code}")
  end


  def countries
    %w[us pr as gu mp vi um]
  end
end