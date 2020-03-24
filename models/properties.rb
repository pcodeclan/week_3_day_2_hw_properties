require( 'pg' )

class Properties

  attr_accessor :address, :value, :num_rooms, :year_built
  attr_reader :id

  def initialize(selection)
    @address = selection['address']
    @value = selection['value']
    @num_rooms = selection['num_rooms'].to_i
    @year_built = selection['year_built'].to_i
    @id = selection['id'].to_i if selection['id']
  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO properties_table
          (
            address,
            value,
            num_rooms,
            year_built
          )
          VALUES
          ($1, $2, $3, $4)
          RETURNING id
          "
          attributes = [@address, @value, @num_rooms, @year_built]
          db.prepare("save", sql)
          @id = db.exec_prepared("save", attributes)[0]["id"].to_i
          db.close
  end

  def update()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "UPDATE properties_table
          SET
          (
            address,
            value,
            num_rooms,
            year_built
            ) =
            ($1, $2, $3, $4)
            WHERE id = $5"
      attributes = [@address, @value, @num_rooms, @year_built, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", attributes)
      db.close
    end

    def delete()
      db = PG.connect({dbname: 'properties', host:'localhost'})
      sql = "DELETE FROM properties_table
            WHERE id = $1"
      attributes = [@id]
      db.prepare("delete", sql)
      db.exec_prepared("delete", attributes)
      db.close
    end

    def Properties.find_by_id()
      db = PG.connect({dbname: 'properties', host:'localhost'})
      sql = "SELECT * FROM properties_table
            WHERE id = 1"
      db.prepare("find", sql)
      properties = db.exec_prepared("find")
      db.close
      return properties.map {|property_hash| Properties.new(property_hash)}
    end

  #   def Properties.delete_all()
  #   db = PG.connect({dbname: 'properties', host: 'localhost'})
  #   sql = "DELETE FROM properties_table"
  #   db.prepare("delete_all", sql)
  #   db.exec_prepared("delete_all")
  #   db.close
  # end

  # def Properties.all()
  #   db = PG.connect({dbname: 'properties', host: 'localhost'})
  #   sql = "SELECT * FROM properties_table"
  #   db.prepare("all", sql)
  #   properties = db.exec_prepared("all")
  #   db.close
  #   return properties.map {|property_hash| Properties.new(property_hash)}
  # end

end
