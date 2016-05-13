class Match

    attr_reader(:id, :home_team, :away_team)
    def initialize(opts)
        @id = opts['id']
        @home_team = opts['home_team']
        @away_team = opts['away_team']
        @winning_team = opts['winning_team']
    end

    def winner()
        return @winning_team
    end

    def get_vs()
        sql1 = "SELECT * FROM teams WHERE home_team = #{@home_team};"
        sql2 = "SELECT * FROM teams WHERE away_team = #{@away_team};"
        h_t = Team.create(sql1, false)
        a_t = Team.create(sql2, false)
        return "#{h_t.name} VS #{a_t.name}"
    end


    def self.create(sql, multi=false)
        res = SQLRun.exec(sql)
        mch = res.map {|r| Match.new(r)}
        return multi ? mch : mch.first
    end

end
