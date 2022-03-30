user_foo = User.new(email: 'foo@example.com', password: 'client')
user_foo.save!

user_bar = User.new(email: 'bar@example.com', password: 'client')
user_bar.save!