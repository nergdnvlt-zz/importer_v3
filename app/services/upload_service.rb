class UploadService
  include RolandProductPath
  # include DateValidator
  include ZipParser
  include ZipValidator
  include SubCreator

  def initialize(company, subs)
    @company = company
    @subs = subs
    @am_subs = []
    @invalid_subs = []
    @zips = LocalZipService.new.zips
  end

  def self.batch_upload(company, subs)
    new(company, subs).batch_upload
  end

  def batch_upload
    # No Rejections
    validate_product_paths

    #Validate Dates
    # validate_date_format

    #Seperate US Subs
    separate_us_subs

    # Reject and put in invalid if zip doesnt match
    validate_us_sub_zips

    binding.pry

    save_am_subs

    save_subs

    save_invalid_subs
    
  end


  def separate_us_subs
    @subs.select! do |sub| 
      @am_subs << sub if sub[:country].upcase == 'US'
      sub if sub[:country] != 'US'
    end
  end

  def validate_us_sub_zips
    # USE AFTER ROLAND
    # Zips are evaluated first be ZipParser and then validated by ZipValidator
    # validate_zips(format_zips(@am_subs))

    roland_validate_zips(format_zips(@am_subs))
  end
end