class ZipCodeService
    def self.run(postal_code)
      new(postal_code).run
    end
  
    def run
      find_zip_and_country
    end
  
    private
  
    def initialize(postal_code)
      @postal_code = postal_code
      @countries = %w[us pr as gu mp vi um]
    end
  
    def find_zip_and_country
      status = 404
      @countries.each do |country|
        status = Faraday.get("http://api.zippopotam.us/#{country}/#{@postal_code}").status
        return status if status == 200
      end
      status
    end
end