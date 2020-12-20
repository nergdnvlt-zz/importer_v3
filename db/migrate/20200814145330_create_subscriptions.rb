class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
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
      t.boolean :live
      t.string :account_id
      t.string :product_path
      t.integer :quantity
      t.string :currency
      t.float :list_price
      t.string :interval
      t.integer :interval_length
      t.datetime :begin_date
      t.datetime :trial_end_date
      t.datetime :next_charge_date
      t.datetime :end_date
      t.integer :interval_count
      t.string :coupon_code
      t.string :discount_type
      t.string :discount_value
      t.string :discount_duration
      t.string :tax_exemption
      t.string :manual_renew

      t.timestamps
    end
  end
end
