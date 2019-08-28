User.destroy_all
Room.destroy_all
Message.destroy_all

# In order to attach a png file with ActiveStorage, I had to remove the column, avatar, from the users table
betty = User.create!({username: 'betty', password: 'password'})
betty.avatar.attach(
  io: File.open('./public/avatar_images/icons8-school-director-female-skin-type-1-2-50.png'),
  filename: 'icons8-school-director-female-skin-type-1-2-50.png',
  content_type: 'application/png'
)

# User.create({username: '', password: '', avatar: ''})
# User.create({username: '', password: '', avatar: ''})
# User.create({username: '', password: '', avatar: ''})
# User.create({username: '', password: '', avatar: ''})
# User.create({username: '', password: '', avatar: ''})
# User.create({username: '', password: '', avatar: ''})
# User.create({username: '', password: '', avatar: ''})

cats = Room.create(name: 'Cat Lovers')
trek = Room.create(name: 'Trekkies')
cons = Room.create(name: 'Conspiracy Theorists')

Message.create(user: betty, room: cats, title: 'Mr. Whiskers', content: 'Mr. Whiskers is my best friend.')
