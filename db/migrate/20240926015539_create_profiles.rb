class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :profilable, polymorphic: true, null: false
      t.string :loan_purpose
      t.text :financial_status

      t.timestamps
    end
  end
end
