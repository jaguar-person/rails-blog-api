require "faker"
require "json"

fake_logins = []
(1..100).each do |id|
  fake_logins.push(Faker::Name.unique.name)
end

fake_ip_v4_addresses = []
(1..50).each do |id|
  fake_ip_v4_addresses.push(Faker::Internet.ip_v4_address)
end

uri = URI.parse("http://localhost:3000/api/posts")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/json"

created_user_list = []
created_post_list = []

(1..20000).each do |id|
  request.body = JSON.dump({
    title: Faker::Sports::Football.team,
    body: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    ip: fake_ip_v4_addresses[rand(50)],
    login: fake_logins[rand(100)],
  })

  response = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(request)
  end

  response = JSON.parse(response.body)
  created_user_list.push(response["user_id"])
  created_post_list.push(response["id"])
end

uri = URI.parse("http://localhost:3000/api/ratings")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/json"

(1..15000).each do |id|
  random_user_id = rand(created_user_list.length() - 1)
  random_post_id = rand(created_post_list.length() - 1)

  request.body = JSON.dump({
    user_id: created_user_list[random_user_id],
    post_id: created_post_list[random_post_id],
    value: rand(4) + 1,
  })

  response = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(request)
  end
end
