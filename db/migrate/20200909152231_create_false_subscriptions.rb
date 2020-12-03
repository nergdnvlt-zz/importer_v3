class CreateFalseSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :false_subscriptions do |t|
      t.string :reference_id
      t.string :first
      t.string :last
      t.string :email
      t.string :buyer_company
      t.string :phone
      t.string :language
      t.string :country
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :live
      t.string :account_id
      t.string :product_path
      t.string :quantity
      t.string :currency
      t.string :list_price
      t.string :interval
      t.string :interval_length
      t.string :begin_date
      t.string :trial_end_date
      t.string :next_charge_date
      t.string :end_date
      t.string :interval_count
      t.string :tax_exemption
      t.string :manual_renew
      t.string :site_id
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
