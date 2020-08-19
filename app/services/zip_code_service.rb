class ZipCodeService
    def self.run(postal_code)
      new(postal_code).run
    end
  
    def run
      a = create_zip
      binding.pry
    end
  
    private
  
    def initialize(postal_code)
      @postal_code = postal_code
      @countries = %w[us pr as gu mp vi um]
    end

    # Create ZipCode if new
    def create_zip
      if find_zip_and_country[0] == 200
        ZipCode.create(
          postal_code: @postal_code,
          state: find_zip_and_country[1]
        )
      end
      find_zip_and_country[0]
    end
  
    # Check if zip is in API
    def find_zip_and_country
      @countries.map do |country|
        eval_territory(country)
      end.uniq
    end

    # Eval for each Terrritory
    def eval_territory(country)
      return [ @conn.status, country ] if conn(country).status == 200
      @conn.status
    end

    # API Request
    def conn(country)
      @conn ||= Faraday.get("http://api.zippopotam.us/#{country}/#{@postal_code}")
      binding.pry
    end
end