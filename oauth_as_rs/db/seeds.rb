member_foo = Member.new(email: 'foo@example.com', password: 'password')
member_foo.save!

member_bar = Member.new(email: 'bar@example.com', password: 'password')
member_bar.save!

Memo.create(favorite: 'ふじ', member: member_foo)
Memo.create(favorite: 'シナノゴールド', member: member_bar)
