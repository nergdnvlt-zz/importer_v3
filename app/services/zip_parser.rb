module ZipParser

  def format_zips(subs)
    subs.each do |sub|
        sub[:postal_code] = parse_zip(sub[:postal_code])
    end
  end


  def parse_zip(incoming_zip)
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
end

