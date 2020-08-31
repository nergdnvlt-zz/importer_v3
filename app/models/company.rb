class Company < ApplicationRecord
    validates_presence_of :name, :site_id

    has_many :subscriptions
end
