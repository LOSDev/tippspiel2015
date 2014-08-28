json.array!(@tipp_groups) do |tipp_group|
  json.extract! tipp_group, :id, :user_id, :password, :name
  json.url tipp_group_url(tipp_group, format: :json)
end
