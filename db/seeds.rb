# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating Users

text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus scelerisque lacinia. In ac elit urna. Proin et pulvinar sem. In ultricies, urna ut scelerisque laoreet, justo enim pharetra turpis, sit amet dignissim urna lectus ut ante. Maecenas id semper neque. Vivamus ultricies nec dui eget faucibus. Aliquam dictum malesuada ante, eu mattis eros consequat eu. Vivamus sodales eget massa a elementum. Cras vitae mauris velit. Sed consectetur augue fermentum augue laoreet vestibulum. Pellentesque sodales, nisl a tempor fermentum, enim tellus auctor augue, vel egestas augue libero et tellus. Cras ex dui, pulvinar sit amet fringilla a, vulputate et metus.

Ut at libero consectetur, finibus augue eu, feugiat mauris. Integer sollicitudin orci ex, facilisis tempor mauris tristique id. Donec et tristique est, eget tempus justo. Integer lacus nibh, sollicitudin imperdiet tempor vitae, dictum et tellus. Suspendisse in arcu mattis eros lacinia blandit. Donec a sapien felis. Aenean ornare interdum risus eget molestie. Nulla facilisis lacus non lacus bibendum, id posuere augue porttitor. Nullam sodales enim sem, et ultricies lorem hendrerit at. Mauris placerat dictum sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam cursus venenatis nisl sed blandit."


users = User.create([
  { name: 'Nelsino', photo: 'Cool_Photo_1', bio: "I'm the last oracle", posts_counter: 0},
  { name: 'Hamza', photo: 'Cool_Photo_1', bio: "I'm the First oracle", posts_counter: 0},
  { name: 'Juan', photo: 'Cool_Photo_1', bio: "I'm the Best oracle", posts_counter: 0},
  { name: 'Mateo', photo: 'Cool_Photo_1', bio: "I'm the Crazy oracle", posts_counter: 0},
  { name: 'Laylo', photo: 'Cool_Photo_1', bio: "I'm the sleepy oracle", posts_counter: 0},
  { name: 'Herbert', photo: 'Cool_Photo_1', bio: "I'm the rider oracle", posts_counter: 0}
  ])

all_users = User.all

all_users.each do |user|
  for j in 1..5 do
    Post.create(title: "Post ##{j}", text: text, comments_counter: 0, likes_counter: 0, author_id: user.id)
  end
end

all_posts = Post.all

all_posts.each do |post|
  for j in 1..5 do
    Like.create(author_id: all_users[j].id, post_id: post.id)
    Comment.create(author_id: all_users[j].id, post_id: post.id, text: "I'm #{all_users[j].name} and I'm commenting gibberish here.")
  end
end
