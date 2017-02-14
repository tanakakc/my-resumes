require "rails_helper"

feature "Resumes" do
  context "as a user" do
    scenario "add a new resume" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

      visit root_path
      expect(page).to have_content "あなたの履歴書"
      click_link("+ 作成")

      expect(page).to have_current_path(new_resume_path)
      expect(page).to have_content "新しく履歴書を作成する"

      fill_in "企業名", with: "株式会社ABC"
      fill_in "志望動機", with: "ここに志望動機を書く"
      fill_in "自己PR", with: "ここに自己PRを書く"
      fill_in "本人希望事項", with: "ここに本人希望事項を書く"
      click_button "履歴書作成"

      expect(page).to have_content "履歴書を作成しました。"
      expect(page).to have_current_path(root_path)
      expect(page).to have_content "株式会社ABC"
    end
  end

  context "as a not user" do
    scenario "can't access" do
      visit root_path
      expect(page).not_to have_content "履歴書を作成"
    end
  end
end
