json.array!(@tipps) do |tipp|
  json.extract! tipp, :id, :result, :user_id, :match_id, :points
  json.url tipp_url(tipp, format: :json)
end
