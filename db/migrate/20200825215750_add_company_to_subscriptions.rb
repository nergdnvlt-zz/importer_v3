class AddCompanyToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :company, null: false, foreign_key: true
  end
end
