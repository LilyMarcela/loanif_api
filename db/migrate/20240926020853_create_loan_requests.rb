class CreateLoanRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :loan_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :amount
      t.integer :repayment_period
      t.string :status
      t.string :loan_purpose

      t.timestamps
    end
  end
end
