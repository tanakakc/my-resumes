require 'rails_helper'

RSpec.describe User, type: :model do
  # メールとパスワードがあり、パスワードとパスワード確認が同じであれば有効な状態であること
  it "is valid with a email, password and password confirmation that same as password" do
    user = User.new(
      email: 'test@example.com',
      password: 'password', password_confirmation: 'password'
    )
    expect(user).to be_valid
  end

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_confirmation_of(:password).on(:create) }
end
