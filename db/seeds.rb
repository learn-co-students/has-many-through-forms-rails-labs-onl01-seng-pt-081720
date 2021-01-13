User.create!(username: "Joe", email: "Someemail@email.email")
User.create!(username: "Moe", email: "Someotheremail@email.email")

a = Category.create!(name: "Category 1")
b = Category.create!(name: "Category 2")
c = Category.create!(name: "Category 3")
d = Category.create!(name: "Category 4")
e = Category.create!(name: "Category 5")
f = Category.create!(name: "Category 6")

g = Post.create!(title: "Title 1", content: "Content 1")
g.categories << [ a, b]
h = Post.create!(title: "Title 2", content: "Content 2")
h.categories << [ c, d]
i = Post.create!(title: "Title 3", content: "Content 3")
i.categories << [ e, f]
j = Post.create!(title: "Title 4", content: "Content 4")
j.categories << [ a, b, c, d]

User.all.first.comments.build( content: "Some mean comment 1", post: Post.find(1)).save
User.all.first.comments.build( content: "Some mean comment 2", post: Post.find(2)).save
User.all.first.comments.build( content: "Some mean comment 3", post: Post.find(3)).save
User.all.first.comments.build( content: "Some mean comment 4", post: Post.find(4)).save
User.all.last.comments.build( content: "Some mean comment 5", post: Post.find(1)).save
User.all.last.comments.build( content: "Some mean comment 6", post: Post.find(2)).save
User.all.last.comments.build( content: "Some mean comment 7", post: Post.find(3)).save
User.all.last.comments.build( content: "Some mean comment 8", post: Post.find(4)).save
