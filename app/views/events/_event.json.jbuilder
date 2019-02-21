json.extract! event, :id, :name, :details, :starts_at, :ends_at, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
