class CreateZipCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :zip_codes do |t|
      t.string :postal_code
      t.string :state
    end
  end
end
