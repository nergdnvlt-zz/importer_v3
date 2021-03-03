class UpdateForeignKey < ActiveRecord::Migration[6.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :subscriptions, :companies
    remove_foreign_key :invalid_subscriptions, :companies

    # add the new foreign_key
    add_foreign_key :subscriptions, :companies, on_delete: :cascade
    add_foreign_key :invalid_subscriptions, :companies, on_delete: :cascade
  end
end
