class Company < ApplicationRecord
  validates_presence_of :name

  has_many :subscriptions
  has_many :american_subscriptions
  has_many :false_subscriptions
end
