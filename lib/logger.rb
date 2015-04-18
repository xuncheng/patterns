class Logger
  FORMAT = %{[%s] "%s %s %s"\n} # [2014-07-24 10:31:11] "GET / HTTP/1.1"

  def initialize(app)
    @app = app
  end

  def call(env)
    puts FORMAT % [ Time.now.strftime("%Y-%m-%d %H:%M:%S"), env["REQUEST_METHOD"], env["PATH_INFO"], env["HTTP_VERSION"] ]
    @app.call(env)
  end
end
