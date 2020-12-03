class ZipService
  attr_reader :zips

  def real?(zip)
    return true if @zips.include?(zip)

    return true if ZipCodeService.run(zip)[0] == 200

    false 
  end

  def initialize
    @zips = import_all
  end

  def import_all
    CSV.foreach('./lib/seeds/us_zip_codes.csv', headers: true).map{ |row| row["Zip"] }
  end
end