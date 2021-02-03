module UsStateService
  def validate_us_region(country, region)
    return "INVALID" if region.nil? && country == 'US'

    if country == 'US'
      region = region.upcase

      if states.include?(region) == false
        region = "#{region}-INVALID"
      end
    end

    region
  end
  
  def states
    %w[ 
      AL
      AK
      AS
      AZ
      AR
      CA
      CO
      CT
      DE
      DC
      FM
      FL
      GA
      GU
      HI
      ID
      IL
      IN
      IA
      KS
      KY
      LA
      ME
      MH
      MD
      MA
      MI
      MN
      MS
      MO
      MT
      NE
      NV
      NH
      NJ
      NM
      NY
      NC
      ND
      MP
      OH
      OK
      OR
      PW
      PA
      PR
      RI
      SC
      SD
      TN
      TX
      UT
      VT
      VI
      VA
      WA
      WV
      WI
      WY
    ]
  end
end