class WorkHistory < ApplicationRecord
  belongs_to :user
  validates_presence_of :company_name, :joined_at
  validate :leaved_at_must_after_joined_at

  def leaved_at_must_after_joined_at
    if leaved_at && leaved_at <= joined_at
      self.errors.add :leaved_at, "退職日は入社日よりも後にしてください"
    end
  end
end
