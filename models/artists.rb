require('pg')
require('pry-byebug')
require_relative('../db/sql_runner')
class Artist
  attr_accessor :name, :nationality
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @nationality = options['nationality']
    @id = options['id'].to_i if options['id'] 
  end

  def save()
    sql = "INSERT INTO artists (name, nationality) VALUES ('#{@name}', '#{@nationality}') returning *;"
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i

  end

  def delete
    return unless @id
    sql = "DELETE FROM artists WHERE id = '#{@id}'"
    result = SqlRunner.run( sql )
  end

  def update
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = (#{@id})"
    result = SqlRunner.run( sql )
  end


  def self.delete_all
    sql = "DELETE FROM artists;"
    artists = SqlRunner.run( sql )
    return artists.map { |hash| Artist.new(hash) }
  end

 def self.all
   sql = "SELECT * FROM artists;"
   artists = SqlRunner.run( sql )
   return artists.map { |hash| Artist.new(hash) }
 end

 #it will find the artist's album
 def find_album()
  sql = "SELECT * FROM albums where artist_id = #{ @id };"
  result = SqlRunner.run( sql )
  return result.map {|hash| Album.new(hash)}
 end

end