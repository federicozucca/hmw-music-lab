require('pg')
require_relative('../db/sql_runner')

class Album
  attr_accessor :title, :genre, :artist_id, :price

  attr_reader :id

  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i 
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id, price) VALUES ('#{@title}', '#{@genre}', #{@artist_id}, #{@price}) returning *;"
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i
  end

  def delete
    return unless @id
    sql = "DELETE FROM albums WHERE id = '#{@id}'"
    result = SqlRunner.run( sql )
  end

  def update
    sql = "UPDATE albums SET (title) = ('#{@title}') WHERE id = (#{@id})"
    result = SqlRunner.run( sql )
  end


  def self.delete_all
    sql = "DELETE FROM albums;"
    albums = SqlRunner.run( sql )
    return albums.map { |hash| Album.new(hash) }
  end

  def self.all
   sql = "SELECT * FROM albums;"
   albums = SqlRunner.run( sql )
   return albums.map { |hash| Album.new(hash) }
 end

 def find_artist()
  sql = "SELECT * FROM artists where id = #{ @artist_id };"
  result = SqlRunner.run( sql )
  return result.map {|hash| Artist.new(hash)}
 end

 def find_songs()
  sql = "SELECT * FROM songs where album_id = #{ @id };"
  result = SqlRunner.run( sql )
  return result.map {|hash| Song.new(hash)}
 end


end
