module DateValidator
  def validate_optional_date(date)
    return nil if date.nil?

    if date.include?('/')
      date = eval_date(date)
    end

    begin
      new_date = Date.strptime(date, "%Y-%m-%d")
    rescue Date::Error
      date = "#{date}-INVALID"
    end

    date
  end

  def validate_required_date(date)
    return "INVALID" if date.nil?

    if date.include?('/')
      date = eval_date(date)
    end

    begin
      new_date = Date.strptime(date, "%Y-%m-%d")
    rescue Date::Error
      date = "#{date}-INVALID"
    end
    
    date
  end

  def eval_sub_next_charge(next_charge, end_date)
    date = validate_required_date(next_charge)

    if end_date
      date = (Date.strptime(date, "%Y-%m-%d") + 1.day).strftime("%Y-%m-%d")
    end
    
    date
  end

  def eval_date(date)
    "#{year(date)}-#{month(date)}-#{day(date)}"
  end

  def year(date)
    date.split('/')[2]
  end

  def month(date)
    if date.split('/')[0].length == 1
      return '0' + date.split('/')[0]
    else 
      return date.split('/')[0]
    end
  end

  def day(date)
    if date.split('/')[1].length == 1
      return '0' + date.split('/')[1]
    else 
      return date.split('/')[1]
    end
  end

end