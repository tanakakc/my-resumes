require 'rails_helper'

RSpec.describe User, type: :model do
  # メールとパスワード、パスワード確認があり、パスワードとパスワード確認が同じであれば有効な状態であること
  it "is valid with a email, password and password confirmation that same as password" do
    user = User.new(
      email: 'test@example.com',
      password: 'password', password_confirmation: 'password'
    )
    expect(user).to be_valid
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without a email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  # パスワードがなければ無効な状態であること
  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  # パスワードとパスワード確認が同じでなければ無効な状態であること
  it "is invalid with password confirmation is not same as password" do
    user = User.new(password: "password", password_confirmation: "12345")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      email: "test@example.com",
      password: "password", password_confirmation: "password"
    )
    user = User.new(
      email: "test@example.com",
      password: "password", password_confirmation: "password"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
