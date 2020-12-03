class ZipParsingService
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = parse(zip_code)
  end

  def parse(incoming_zip)
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

