require 'rails_helper'

RSpec.describe "Login", type: :system do
  context 'ログインが成功' do
    before do
      user = FactoryBot.create(:user)
    end

    it 'ログイン' do
      visit login_path
      fill_in 'Email', with: 'test@example.com'
      fill_in 'password', with: 'password112'
      click_button 'Login'
    end
  end
end