json.extract! entry, :id, :title, :body_html, :body_md, :created_at, :updated_at
json.url entry_url(entry, format: :json)