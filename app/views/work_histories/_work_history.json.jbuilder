json.extract! work_history, :id, :user_id, :company_name, :joined_at, :leaved_at, :created_at, :updated_at
json.url work_history_url(work_history, format: :json)