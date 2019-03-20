json.extract! comment, :id, :content, :rating, :user_id, :event_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
