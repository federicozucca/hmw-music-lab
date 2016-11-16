require('pg')
require_relative('../db/sql_runner')

class Song
  attr_accessor :song_title, :album_id
  attr_reader :id

  def initialize( options )
    @song_title = options['song_title']
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
  end

  def save()
    sql = "INSERT INTO songs (song_title, album_id) VALUES ('#{@song_title}', #{@album_id}) returning *;"
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i
  end

  def delete
    return unless @id
    sql = "DELETE FROM songs WHERE id = '#{@id}'"
    result = SqlRunner.run( sql )
  end

  def update
    sql = "UPDATE songs SET (song_title) = ('#{@song_title}') WHERE id = (#{@id})"
    result = SqlRunner.run( sql )
  end


  def self.delete_all
    sql = "DELETE FROM songs;"
    songs = SqlRunner.run( sql )
    return songs.map { |hash| Song.new(hash) }
  end

  def self.all
   sql = "SELECT * FROM songs;"
   songs = SqlRunner.run( sql )
   return songs.map { |hash| Song.new(hash) }
 end

#it will find the album from where the song is belonging
 def find_album()
  sql = "SELECT * FROM albums where id = #{ @album_id };"
  result = SqlRunner.run( sql )
  return result.map {|hash| Album.new(hash)}
 end

end
