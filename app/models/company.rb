class Company < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :subscriptions, dependent: :delete_all
  has_many :invalid_subscriptions, dependent: :delete_all
end
