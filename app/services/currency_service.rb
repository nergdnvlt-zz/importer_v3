module CurrencyService
  def validate_fs_currency(currency)
    return 'INVALID' if currency.nil?

    currency = currency.upcase
    
    if fs_currencies.include?(currency) == false
      return "#{currency}-INVALID"
    end
    
    currency
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