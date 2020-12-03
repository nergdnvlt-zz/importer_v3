class SubCreationService
  def self.sub_eval_and_create(company_id, sub)
    new(company_id, sub).eval_and_create
  end

  def eval_and_create
    @sub[:productpath] = ProductPathService.normalize(@sub[:productpath])
    # US Subs
    if @sub[:country] == 'US'

      # Check if State is Nil
      @sub[:region] = 'CA' if @sub[:region].nil? 

      # Validate Zip Format
      @sub[:postalcode] = ZipParsingService.new(@sub[:postalcode]).zip_code
      
      # Error handling and Zip Validation
      if !@sub[:postalcode].nil? && @sub[:postalcode].length == 5 && @zip_list.real?(@sub[:postalcode])
        if !create_american_sub
          create_invalid_sub
        end  
      else
        create_invalid_sub
      end
    
    # Non US Subs
    else
      if !create_sub
        create_invalid_sub
      end
    end
  end

  def initialize(company_id, sub)
    @company ||= Company.find(company_id)
    @sub = sub
    @zip_list = ZipService.new()
  end

  private

  def create_american_sub
    am_sub = @company.american_subscriptions.new(
      reference_id: @sub[:referenceid],
      first: @sub[:first],
      last: @sub[:last],
      email: @sub[:email],
      language: @sub[:language],
      country: @sub[:country],
      postal_code: @sub[:postalcode],
      live: 'TRUE',
      product_path: @sub[:productpath],
      quantity: @sub[:quantity],
      currency: @sub[:currency],
      list_price: fix_list_price(@sub[:listprice]),
      interval: @sub[:interval],
      interval_length: @sub[:intervallength],
      begin_date: @sub[:begindate],
      next_charge_date: @sub[:nextchargedate],
      end_date: @sub[:enddate],
      trial_end_date: @sub[:trialenddate]
    )
    am_sub.save
  end

  def create_invalid_sub
    invalid_sub = @company.invalid_subscriptions.new(
      reference_id: @sub[:referenceid],
      first: @sub[:first],
      last: @sub[:last],
      email: @sub[:email],
      language: @sub[:locale],
      country: @sub[:country],
      postal_code: @sub[:postalcode],
      live: 'TRUE',
      product_path: @sub[:productpath],
      quantity: @sub[:quantity],
      currency: @sub[:currency],
      list_price: fix_list_price(@sub[:listprice]),
      interval: @sub[:interval],
      interval_length: @sub[:intervallength],
      begin_date: @sub[:begindate],
      next_charge_date: @sub[:nextchargedate],
      end_date: @sub[:enddate],
      trial_end_date: @sub[:trialenddate]
    )
    invalid_sub.save
  end

  def create_sub
    sub = @company.subscriptions.new(
      reference_id: @sub[:referenceid],
      first: @sub[:first],
      last: @sub[:last],
      email: @sub[:email],
      language: @sub[:language],
      country: @sub[:country],
      postal_code: @sub[:postalcode],
      live: 'TRUE',
      product_path: @sub[:productpath],
      quantity: @sub[:quantity],
      currency: @sub[:currency],
      list_price: fix_list_price(@sub[:listprice]),
      interval: @sub[:interval],
      interval_length: @sub[:intervallength],
      begin_date: @sub[:begindate],
      next_charge_date: @sub[:nextchargedate],
      end_date: @sub[:enddate],
      trial_end_date: @sub[:trialenddate]
    )
    sub.save
  end

  def fix_list_price(price)
    price.to_f.floor(2).to_s
  end
end