json.extract! post, :id, :title, :body, :created_at
json.author do
  json.extract! post.author, :id, :email, :name, :image
end
json.comments do
  json.array! post.comments do |comment|
    json.extract! comment, :id, :body, :user_id
  end
end
json.tags do
  json.array! post.tags do |tag|
    json.extract! tag, :id, :title
  end
end