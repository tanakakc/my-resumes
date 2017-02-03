class CreateWorkHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :work_histories do |t|
      t.references :user, foreign_key: true
      t.string :company_name
      t.datetime :joined_at
      t.datetime :leaved_at

      t.timestamps
    end
  end
end
