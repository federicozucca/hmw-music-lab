require('pg')
require_relative('../db/sql_runner')

class Collector
  attr_accessor :name, :money_own, :nationality, :album_id

  attr_reader :id

  def initialize( options )
    @name = options['name']
    @money_own = options['money_own']
    @nationality = options['nationality']
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
  end

  def save()
    sql = "INSERT INTO collectors (name, money_own, nationality, album_id) VALUES ('#{@name}', '#{@money_own}', '#{@nationality}', #{@album_id}) returning *;"
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i
  end

  def delete
    return unless @id
    sql = "DELETE FROM collectors WHERE id = '#{@id}'"
    result = SqlRunner.run( sql )
  end

  def update
    sql = "UPDATE collectors SET (name) = ('#{@name}') WHERE id = (#{@id})"
    result = SqlRunner.run( sql )
  end


  def self.delete_all
    sql = "DELETE FROM collectors;"
    collectors = SqlRunner.run( sql )
    return collectors.map { |hash| Collector.new(hash) }
  end

  def self.all
   sql = "SELECT * FROM albums;"
   collectors = SqlRunner.run( sql )
   return collectors.map { |hash| Collector.new(hash) }
  end

  #it will find the album that the collector has and his price
   def find_album()
    sql = "SELECT * FROM albums where id = #{ @album_id };"
    result = SqlRunner.run( sql )
    return result.map {|hash| Album.new(hash)}
   end

end
