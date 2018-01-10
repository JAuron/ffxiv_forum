Lodestone.all.each do |lodestone|
	url = "https://api.xivdb.com/character/#{lodestone.id}"
	resp = Net::HTTP.get_response(URI.parse(url))
	return false if resp.code == "404"
  data = JSON.parse(resp.body)
  lodestone.update_attributes!(
  	name: data["name"],
  	server: data["server"],
  	class_data: data["data"]["classjobs"],
  	metadata: data["data"]
  )
end