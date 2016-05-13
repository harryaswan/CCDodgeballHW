require('pg')
class SQLRun

    def self.exec()
        db = PG.connect({dbname: 'dodgeball', host: 'localhost'})
        result = db.exec( sql )
    ensure
        db.close()
        return result
    end

end
