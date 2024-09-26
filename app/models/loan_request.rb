class LoanRequest < ApplicationRecord
  belongs_to :user

  validates: amount, :repayment_period, :interest_rate, :status, :loan_purpose, presence: true
  validates :amount: numericality: { only_integer: true, greater_than: 100}
end
