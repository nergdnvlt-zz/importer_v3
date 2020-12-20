module BoolTool
  def convert_bools
    @subs.each do |sub|
      sub[:live] = true
    end
  end
end