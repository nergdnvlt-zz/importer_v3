module IntervalService
  def validate_interval(interval)
    return 'INVALID' if interval.nil?

    interval = interval.upcase
    
    if fs_intervals.include?(interval) == false
      return  "#{interval}-INVALID"
    end

    interval
  end
  
  def fs_intervals
    %w[
      DAY
      WEEK
      MONTH
      YEAR
      ADHOC
    ]
  end
end