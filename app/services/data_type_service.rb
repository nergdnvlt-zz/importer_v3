module DataTypeService

  def validate_required_string(sub_field)
    return "INVALID" if sub_field.nil?

    if !sub_field.respond_to?(:to_s)
       return "#{sub_field}-INVALID"
    end

    sub_field
  end

  def validate_optional_string(sub_field)
    return nil if sub_field.nil?

    if !sub_field.respond_to?(:to_s)
       return "#{sub_field}-INVALID"
    end

    sub_field
  end


  def validate_email(email)
    return "INVALID" if email.nil?

    return "#{email}-INVALID" if !email.include?('@')

    if !email.respond_to?(:to_s)
       return "#{email}-INVALID"
    end

    email
  end

  def validate_required_integer(sub_field)
    return "INVALID" if sub_field.nil?

    if sub_field.to_i == 0
      return "#{sub_field}-INVALID"
    end

   sub_field
  end

  def validate_optional_integer(sub_field)
    return nil if sub_field.nil?

    if sub_field.to_i == 0
      return "#{sub_field}-INVALID"
    end

   sub_field
  end

  def validate_required_float(sub_field)
    return "INVALID" if sub_field.nil?

    if sub_field != "0.0" && sub_field.to_f == 0.0
      return "#{sub_field}-INVALID"
    else

      # This will round as expected (above 5 up, below 5 down), it will also force a trailing 0 if needed.
      sub_field = sprintf('%.2f', sub_field)
    end

   sub_field
  end

  def validate_optional_float(sub_field)
    return nil if sub_field.nil?

    if sub_field != "0.0" && sub_field.to_f == 0.0
      return "#{sub_field}-INVALID"
    else

      # This will round as expected (above 5 up, below 5 down), it will also force a trailing 0 if needed.
      sub_field = sprintf('%.2f', sub_field)
    end

   sub_field
  end
end