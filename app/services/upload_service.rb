class UploadService
  include SubCreatorService

  def initialize(company, subs)
    @zips = LocalZipService.new.zips
    @company_id = company.id
    @subs = validate_subs(subs)
    @invalid_subs = []
    seperate_subs()
    remove_seperator()
  end

  def self.batch_upload(company, subs)
    new(company, subs).batch_upload
  end

  def seperate_subs
    @subs.delete_if do |sub|
      if sub[:invalid] == true
        @invalid_subs << sub
      end
      sub[:invalid] == true 
    end
  end

  def remove_seperator
    @invalid_subs.each { |sub| sub.delete(:invalid)}
  end

  def validate_subs(subs)
    subs.each do |sub|
      SubService.validate(@company_id, sub, @zips)
    end
  end

  def batch_upload
    save_subs if !@subs.empty?

    save_invalid_subs if !@invalid_subs.empty?
  end
end