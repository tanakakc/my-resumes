require "rails_helper"

RSpec.describe "User sign in process", type: :feature do
  it "signs me in" do
    User.create(
      email: "test@example.com",
      password: "password", password_confirmation: "password"
    )

    visit "/users/sign_in"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    click_button "ログイン"

    expect(page).to have_text("test@example.com")
    expect(page).to have_text("ログアウト")
  end
end
