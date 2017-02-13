require 'rails_helper'

RSpec.describe Resume, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:company_name) }
end
