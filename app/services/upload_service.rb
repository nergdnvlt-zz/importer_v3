class UploadService
  include ModuleService

  def initialize(company, subs)
    @company_id = company.id
    @subs = subs
    @invalid_subs = []
    @zips = LocalZipService.new.zips
  end

  def self.batch_upload(company, subs)
    new(company, subs).validate_and_batch_upload
  end

  def validate_and_batch_upload
    add_company_id

    validate_sub_fields

    save_subs if !@subs.empty?

    save_invalid_subs if !@invalid_subs.empty?
  end
end