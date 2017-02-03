require 'rails_helper'

RSpec.describe WorkHistory, type: :model do
  it "is valid with user, campany name and joined at as datetime" do
    user = User.create(
      email: "test@example.com",
      password: "password", password_confirmation: "password"
    )
    work_history = user.work_histories.build(
      company_name: "Example Inc.",
      joined_at: "2010-4-1"
    )
    expect(work_history).to be_valid
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:joined_at) }

  it "is invalid with joined_at as string" do
    user = User.create(
      email: "test@example.com",
      password: "password", password_confirmation: "password"
    )
    work_history = user.work_histories.build(joined_at: "a")
    work_history.valid?
    expect(work_history.errors[:joined_at]).to include("を入力してください")
  end

  it "is invalid with joined_at as integer" do
    user = User.create(
      email: "test@example.com",
      password: "password", password_confirmation: "password"
    )
    work_history = user.work_histories.build(joined_at: 1)
    work_history.valid?
    expect(work_history.errors[:joined_at]).to include("を入力してください")
  end


  # 退職日が入社日よりも前なら無効な状態であること
  it "is invalid leaved at is before joined at" do
    user = User.create(
      email: "test@example.com",
      password: "password", password_confirmation: "password"
    )
    work_history = user.work_histories.build(
      company_name: "Example Inc.",
      joined_at: "2010-4-1", leaved_at: "2009-10-31"
    )
    work_history.valid?
    expect(work_history.errors[:leaved_at]).to include("退職日は入社日よりも後にしてください")
  end
end
