class Player

    attr_reader(:id, :name, :position, :team_id)
    def initialize(opts)
        @id = opts['id']
        @name = opts['name']
        @position = opts['position']
        @team_id = opts['team_id']
    end

    def self.create(sql, multi=false)
        res = SQLRun.exec(sql)
        ply = res.map {|r| Player.new(r)}
        return multi ? ply : ply.first
    end

end
