class ZipCode < ApplicationRecord
    validates_presence_of :postal_code, :state
end
