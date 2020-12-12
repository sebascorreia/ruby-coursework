json.extract! album, :id, :band_id, :name, :year, :created_at, :updated_at
json.url album_url(album, format: :json)
