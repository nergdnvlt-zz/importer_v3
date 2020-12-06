# module DateValidator
#   def validate_date_format
#     @subs.select! do |sub|
#       result = dates_correct?(sub)
#       @invalid_subs << sub if result == false
#       sub if result == true
#     end
#   end

#   def dates_correct?(sub)
#     a = date_fields(sub).map do |field|
#       eval_date(sub[field])
#     end
#     binding.pry
#   end

#   def eval_date(date)
#     false if date.split('-')[0].length != 4
#   end

#   def date_fields(sub)
#     sub.keys.select{ |key| key if key.match?("date") }
#   end
# end