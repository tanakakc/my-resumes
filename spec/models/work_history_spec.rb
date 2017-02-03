require 'rails_helper'

RSpec.describe WorkHistory, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:joined_at) }

  # 退職日が入社日よりも前なら無効な状態であること
  it "is invalid leaved at is before joined at"
end
