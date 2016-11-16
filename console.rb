require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')
require_relative('models/songs')
require_relative('models/collectors')
Collector.delete_all
Song.delete_all
Album.delete_all
Artist.delete_all



artist1 = Artist.new({
  'name' => 'ACDC',
  'nationality' => 'Scotland mainly'
  })

artist2 = Artist.new({
  'name' => 'Red Hot Chili Peppers',
  'nationality' => 'American'
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'back in black',
  'genre' => 'rock',
  'artist_id' => artist1.id,
  'price' => 30
  })

album2 = Album.new({
  'title' => 'live in Rio',
  'genre' => 'rock',
  'artist_id' => artist1.id,
  'price' => 20
  })

album1.save()
album2.save()

song1 = Song.new({
  'song_title' => 'Hells Bells',
  'album_id' => album1.id
  })

song2 = Song.new({
  'song_title' => 'Rock And Roll Ain t Noise Pollution',
  'album_id' => album1.id
  })

song3 = Song.new({
  'song_title' => 'Have a drink on me',
  'album_id' => album1.id
  })

song4 = Song.new({
  'song_title' => 'Giving the dog a bone',
  'album_id' => album1.id
  })

song5 = Song.new({
  'song_title' => 'Highway to Hell',
  'album_id' => album1.id
  })

song6 = Song.new({
  'song_title' => 'TNT',
  'album_id' => album1.id
  })

song7 = Song.new({
  'song_title' => 'Guns on fire',
  'album_id' => album1.id
  })

song1.save()
song2.save()
song3.save()
song4.save()
song5.save()
song6.save()
song7.save()

# song1.song_title = '22'
song1.update()


collector1 = Collector.new({
  'name' => 'Elthon John',
  'money_own' =>2000,
  'nationality' => 'British',
  'album_id' => album1.id
  })
collector2 = Collector.new({
  'name' => 'Andrea Boccelli',
  'money_own' =>300,
  'nationality' => 'Italian',
  'album_id' => album2.id
  })

collector1.save
collector2.save

# artist2.name = 'Nirvana'
# artist2.update

binding.pry
nil