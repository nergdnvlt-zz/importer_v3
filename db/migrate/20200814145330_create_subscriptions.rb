class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :reference_id
      t.string :first
      t.string :last
      t.string :email
      t.string :company
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
      t.string :begin_date
      t.string :trial_end_date
      t.string :next_charge_date
      t.string :end_date
      t.integer :interval_count
      t.string :tax_exemption
      t.boolean :manual_renew
      t.string :site_id

      t.timestamps
    end
  end
end
