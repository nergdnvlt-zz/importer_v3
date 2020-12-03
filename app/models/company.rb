class Company < ApplicationRecord
  validates_presence_of :name

  has_many :subscriptions
  has_many :american_subscriptions
  has_many :invalid_subscriptions
end
