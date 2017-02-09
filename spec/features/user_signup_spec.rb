require "rails_helper"

feature "Creating account" do
  context "at root page" do
    xscenario "able to create account on desktop" do
      visit root_path
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"
      fill_in "確認用パスワード", with: "password"
      click_button "アカウント登録"

      expect(page).to have_content("アカウント登録が完了しました。")
      expect(find(".navbar")).to have_css("a", text: "ログアウト")
    end

    scenario "able to access signup page via link on mobile"
  end

  context "at signup page" do
    scenario "create account" do
      visit new_user_registration_path
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"
      fill_in "確認用パスワード", with: "password"
      click_button "アカウント登録"

      expect(page).to have_content("アカウント登録が完了しました。")
      expect(find(".navbar")).to have_css("a", text: "ログアウト")

    end
  end
end
