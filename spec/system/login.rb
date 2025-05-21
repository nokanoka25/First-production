require 'rails_helper'

RSpec.describe "Login", type: :system do
  context 'ログインが成功' do
    let!(:user) { FactoryBot.create(:user, email: 'test@example.com', password: 'password112') }

    it 'ログイン' do
      visit login_path
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'password123'
      click_button 'Login'

      expect(find_field('email').value).to eq 'test@example.com'
      expect(page).to have_current_path(user_path(user))
      expect(page).to have_content('ログインに成功しました')
    end
  end
end