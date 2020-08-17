require 'csv'

us_zip_codes = './lib/seeds/us_zip_codes.csv'

CSV.foreach(us_zip_codes, headers: true, header_converters: :symbol) do |row|
    ZipCode.create!(
        postal_code: row[:zip],
        state: row[:state]
    )
end