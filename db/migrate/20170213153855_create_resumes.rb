class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.references :user, foreign_key: true
      t.string :company_name
      t.text :entry_reason
      t.text :summary
      t.text :request

      t.timestamps
    end
  end
end
