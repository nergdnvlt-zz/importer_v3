class SubService
  include ModuleService

  def self.validate(company, sub, zips)
    new(company, sub, zips).validate
  end

  def validate
    return invalid?(@sub)
  end

  def initialize(company, sub, zips)
    @company = company
    @zips = zips
    @sub = validate_fields(sub)
  end

  def invalid?(sub)
    if sub.values.flatten.select { |x| x if x.class == String }.select { |y| y if y.include?('INVALID') }.empty? == false
      sub[:invalid] = true
    end
  end

  def validate_fields(sub)
    sub[:reference_id] = validate_required_string(sub[:reference_id])
    sub[:first] = validate_required_string(sub[:first])
    sub[:last] = validate_required_string(sub[:last])
    sub[:language] = validate_language(sub[:language])
    sub[:postal_code] = validate_us_postal_code(sub[:country], sub[:postal_code])
    sub[:region] = validate_us_region(sub[:country], sub[:region])
    sub[:country] = validate_fs_country(sub[:country])
    sub[:live] = true
    sub[:email] = validate_email(sub[:email])
    sub[:product_path] = validate_required_string(sub[:product_path])
    sub[:quantity] = validate_required_integer(sub[:quantity])
    sub[:currency] = validate_fs_currency(sub[:currency])
    sub[:list_price] = validate_required_float(sub[:list_price])
    sub[:interval] = validate_interval(sub[:interval])
    sub[:interval_length] = validate_required_integer(sub[:interval_length])
    sub[:begin_date] = validate_optional_date(sub[:begin_date])
    sub[:end_date] = validate_optional_date(sub[:end_date])
    sub[:next_charge_date] = eval_sub_next_charge(sub[:next_charge_date], sub[:end_date])
    sub[:trial_end_date] = validate_optional_date(sub[:trial_end_date])
    sub[:interval_count] = validate_optional_integer(sub[:interval_count])
    sub[:coupon_code] = validate_optional_string(sub[:coupon_code])
    sub[:discount_type] = validate_discount_type(sub[:discount_type])
    sub[:discount_value] = validate_optional_float(sub[:discount_value])
    sub[:discount_duration] = validate_optional_integer(sub[:discount_duration])
    sub[:tax_exemption_data] = validate_optional_string(sub[:tax_exemption_data])
    sub[:manual_renew] = nil if sub[:manual_renew] != false
    sub[:company_id] = @company

    sub
  end
end