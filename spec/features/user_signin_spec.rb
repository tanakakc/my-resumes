require "rails_helper"

feature "User sign in/out process" do
  given(:user) { FactoryGirl.create(:user) }

  scenario "Sign in with valid input" do
    visit "/users/sign_in"
    expect(page).not_to have_content user.email
    expect(page).not_to have_css("a", text: "ログアウト")

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(page).to have_content "ログインしました。"
    expect(page).to have_content user.email
    expect(page).to have_css("a", text: "ログアウト")
  end

  scenario "Sign in with invalid input" do
    visit "/users/sign_in"

    fill_in "メールアドレス", with: "other@exapmle.com"
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(page).to have_content "メールアドレスまたはパスワードが違います。"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "incorrect"
    click_button "ログイン"

    expect(page).to have_content "メールアドレスまたはパスワードが違います。"
  end

  scenario "Sign out" do
    sign_in user
    visit root_path

    expect(page).not_to have_content "ログイン"
    expect(page).to have_content "ログアウト"

    click_link "ログアウト"

    expect(page).to have_content "ログアウトしました。"
    expect(page).to have_css("a", text: "ログイン")
    expect(page).not_to have_css("a", text: "ログアウト")
  end
end
