module FieldValidator
  def validate_sub_fields
    add_company_id

    convert_bools

    validate_countries

    validate_languages

    validate_currencies

    validate_date_format

    us_zips
  end

  def add_company_id
    @subs.each do |sub|
      sub[:company_id] = @company_id
    end
  end
end