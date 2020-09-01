require 'rails_helper'

describe 'Company' do
  describe 'As a user' do
    context 'I need to create a company account' do
      visit '/'

      click_link 'Create Company Account'

      expect(current_path).to eq(new_company_path)

      fill_in 'Name', with: 'Banahogg'
      fill_in 'Site ID', with: 'banahogg'
      click_on 'Add Company'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Banahogg')
      expect(page).to have_link('Sign Out')
      expect(page).to_not have_link('Sign In')
    end
  end
end
