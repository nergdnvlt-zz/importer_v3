module CurrencyService
  def validate_currencies
    @subs.select! do |sub| 
      result = valid_currency?(sub[:currency])
      @invalid_subs << sub if result == false
      
      sub if result == true
    end
  end

  def valid_currency?(currency)
    return false if currency.nil?
    
    fs_currencies.include?(currency)
  end

  def fs_currencies
    %w[
      USD
      EUR
      GBP
      AUD
      CAD
      NZD
      CHF
      SEK
      CZK
      DKK
      PLN
      RUB
      SGD
      JPY
      CNY
      HKD
      INR
      ZAR
      BRL
      MXN
      COP
      CLP
      KRW
    ]
  end
end