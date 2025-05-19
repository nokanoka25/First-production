require 'rails_helper'

RSpec.describe "Login", type: :system do
  context 'ログインが成功' do
    let!(:user) { FactoryBot.create(:user, email: 'test@example.com', password: 'password112') }

    it 'ログイン' do
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Login'

      expect(page).to have_content('ログインに成功しました')
    end
  end
end