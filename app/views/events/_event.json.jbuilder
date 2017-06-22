json.extract! event, :id, :description, :date_of_event, :solved, :solution_description, :created_at, :updated_at, :cat_id
json.url event_url(event, format: :json)
