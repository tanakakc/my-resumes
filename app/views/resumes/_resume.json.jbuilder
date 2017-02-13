json.extract! resume, :id, :user_id, :company_name, :entry_reason, :summary, :request, :created_at, :updated_at
json.url resume_url(resume, format: :json)