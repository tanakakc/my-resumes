class Resume < ApplicationRecord
  belongs_to :user
  validates_presence_of :company_name
end
