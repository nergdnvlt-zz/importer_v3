require 'rails_helper'

RSpec.describe ZipCode, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:state) }
  end
end
