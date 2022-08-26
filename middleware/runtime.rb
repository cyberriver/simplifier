class Runtime

  def initialize(app)
    @app = app
  end

  def call(env)
    puts "LOG Runtime: call runtime"
    start = Time.now
    puts "LOG Runtime: call env"
    status, headers, body = @app.call(env)
    headers['Response_time'] = "%fs"%(Time.now- start)
    puts "LOG Runtime: Full response #{status} #{headers} #{body}"

    [status, headers, body]

  end

end
