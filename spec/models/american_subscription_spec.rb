require 'rails_helper'

RSpec.describe AmericanSubscription, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:reference_id) }
    it { should validate_presence_of(:first) }
    it { should validate_presence_of(:last) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:language) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:live) }
    it { should validate_presence_of(:account_id) }
    it { should validate_presence_of(:product_path) }
    it { should validate_presence_of(:quantity) }        
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:list_price) }
    it { should validate_presence_of(:interval) }
    it { should validate_presence_of(:interval_length) }
    it { should validate_presence_of(:next_charge_date) }
    it { should validate_presence_of(:site_id) }
  end

  describe 'positive zip validations' do
    it 'takes a normal zip just fine' do
      zip_code = "80829"
      sub = create(:american_subscription, postal_code: zip_code)
      
      expect(sub).to be_a(AmericanSubscription)
      expect(sub.postal_code).to eq(zip_code)
    end

    it 'validates a 3 digit zip that exists' do
      sub = create(:american_subscription, postal_code: "979")

      expect(sub).to be_a(AmericanSubscription)
      expect(sub.postal_code).to eq("00979")
    end

    it 'does validates a 3 digit zip that does not exist in table but does in API' do
      zip_code = "918"
      
      ZipCode.where(postal_code: "00#{zip_code}").delete_all
      
      sub = create(:american_subscription, postal_code: zip_code)

      zip = ZipCode.find_by(postal_code: "00#{zip_code}")

      expect(zip).to be_a(ZipCode)
      expect(zip.postal_code).to eq("00#{zip_code}")
      
      expect(sub).to be_a(AmericanSubscription)
      expect(sub.postal_code).to eq("00#{zip_code}")
    end

    it 'validates a 4 digit zip that exists' do
      sub = create(:american_subscription, postal_code: "4110")

      expect(sub).to be_a(AmericanSubscription)
      expect(sub.postal_code).to eq("04110")
    end

    it 'removes a suffix from the postal code' do
      zip_code = "80829"
      sub = create(:american_subscription, postal_code: "#{zip_code}-2309")
      
      expect(sub).to be_a(AmericanSubscription)
      expect(sub.postal_code).to eq(zip_code)
    end
  end
  
  describe 'negative zip validations' do
    it 'does not validate a 3 digit zip that does not exist' do
      zip_code = "881"
      sub = build(:american_subscription, postal_code: zip_code)
      
      expect(ZipCode.find_by(postal_code: "00#{zip_code}")).to be_nil
      expect(sub).to_not be_valid
    end

    it 'does not validate a nil zip' do
      sub = build(:american_subscription, postal_code: nil)
  
      expect(sub).to_not be_valid
    end

    it 'does not validate a blank zip' do
      sub = build(:american_subscription, postal_code: "")
  
      expect(sub).to_not be_valid
    end

    it 'does not validate a 4 digit zip that does not exist in database but does in API' do
      zip_code = "2918"
        
      ZipCode.where(postal_code: "0#{zip_code}").delete_all
  
      sub = create(:american_subscription, postal_code: zip_code)
  
      zip = ZipCode.find_by(postal_code: "0#{zip_code}")
  
      expect(zip).to be_a(ZipCode)
      expect(zip.postal_code).to eq("0#{zip_code}")
        
      expect(sub).to be_a(AmericanSubscription)
      expect(sub.postal_code).to eq("0#{zip_code}")
    end

    it 'does not validate a 4 digit zip that does not exist' do
      zip_code = "5011"
        
      ZipCode.where(postal_code: "0#{zip_code}").delete_all
  
      sub = build(:american_subscription, postal_code: zip_code)
        
      expect(sub).to_not be_valid
    end

    it 'invalidates all other zips longer than 5 digits' do
      zip_code = "80829"
      sub = build(:american_subscription, postal_code: "#{zip_code}2309")
        
      expect(sub).to_not be_valid
    end
  end
end