require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :site_id }
  end

  describe 'Relationships' do
    it {should have_many :subscriptions }
  end
end
