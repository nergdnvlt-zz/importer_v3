class LocalZipService
  attr_reader :zips

  def initialize
    @zips = import_all
  end
  
  def import_all
    CSV.foreach('./lib/seeds/fs_zips.csv', headers: true).map{ |row| row["Zip"] }
  end

  ## Old List
  # def import_all
  #   CSV.foreach('./lib/seeds/us_zip_codes.csv', headers: true).map{ |row| row["Zip"] }
  # end
end