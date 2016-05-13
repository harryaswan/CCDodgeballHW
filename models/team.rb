class Team

    attr_reader(:id, :name, :location)
    def initialize(opts)
        @id = opts['id']
        @name = opts['name']
        @location = opts['location']
    end

    def matches()

    end



    def self.create(sql, multi=false)
        res = SQLRun.exec(sql)
        tm = res.map {|r| Team.new(r)}
        return multi ? tm : tm.first
    end

end
