class UploadService
  include BoolTool
  include DateValidator
  include RolandProductPath
  include ZipParser
  include ZipValidator
  include SubCreator

  def initialize(company, subs)
    @company_id = company.id
    @subs = subs
    @am_subs = []
    @invalid_subs = []
    @zips = LocalZipService.new.zips
  end

  def self.batch_upload(company, subs)
    new(company, subs).batch_upload
  end

  def batch_upload
    # Add Company ID as raw value
    add_company_id

    # For ROLAND No Rejections
    validate_product_paths

    # Validate Dates
    validate_date_format

    #Convert booleans
    convert_bools

    #Seperate US Subs
    separate_us_subs

    # Reject and put in invalid if zip doesnt match
    validate_us_sub_zips

    save_am_subs if !@am_subs.empty?

    save_subs if !@subs.empty?

    save_invalid_subs if !@invalid_subs.empty?
  end

  def add_company_id
    @subs.each do |sub|
      sub[:company_id] = @company_id
    end
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