class Coach

    attr_reader(:id, :name, :team_id)
    def initialize(opts)
        @id = opts['id']
        @name = opts['name']
        @team_id = opts['team_id']
    end

    def self.create(sql, multi=false)
        res = SQLRun.exec(sql)
        coa = res.map {|r| Coach.new(r)}
        return multi ? coa : coa.first
    end

end
