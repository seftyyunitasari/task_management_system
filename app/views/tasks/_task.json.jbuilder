json.extract! task, :id, :title, :detail, :deadline, :priority, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
