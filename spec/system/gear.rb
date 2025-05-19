require 'rails_helper'

RSpec.describe 'キャンプギア管理', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    # ユーザーでログイン
    visit login_path
      fill_in 'Email', with: 'test@example.com'
      fill_in 'password', with: 'password112'
      click_button 'Login'
  end

  it 'キャンプギア登録が成功する', js: true do
    visit user_path(user)

    click_on 'キャンプギア'

    click_on 'キャンプギア登録'

    select 'テント', from: 'ギアの種類'

    fill_in 'ギアの名前', with: 'テント'

    fill_in '設置面積縦', with: '10'

    fill_in '設置面積横', with: '10'

    click_button '保存'

    click_on 'キャンプギア'

    expect(page).to have_content('テント')
    expect(page).to have_content('設置面積 縦: 10 横: 10')
  end
end