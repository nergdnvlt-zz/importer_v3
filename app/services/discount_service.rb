module DiscountService
  def validate_discount_type(discount)
    return nil if discount.nil?

    discount = discount.downcase
    
    if fs_discount_types.include?(discount) == false
      return  "#{discount}-INVALID"
    end

    discount
  end
  
  def fs_discount_types
    %w[
      percent
      amount
    ]
  end
end