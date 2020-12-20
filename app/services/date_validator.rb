module DateValidator
  def validate_date_format
    @subs.each do |sub| 
      correct_dates(sub)
    end
  end

  def correct_dates(sub)
    date_fields(sub).each do |field|
      if !sub[field].nil? && sub[field].include?('/')
        sub[field] = eval_date(sub[field])
      end
    end
  end

  def eval_date(date)
    "#{year(date)}-#{month(date)}-#{day(date)}"
  end

  def date_fields(sub)
    sub.keys.select{ |key| key if key.match?("date") }
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