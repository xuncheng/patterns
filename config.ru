# Start with: shotgun -I. -Ilib
# Under Windows: rackup -I. -Ilib  (CTRL+C and restart on each change)

require "logger"

Routes = {
  "GET" => {},
  "POST" => {}
}

class App
  def call(env)
    method = env["REQUEST_METHOD"]
    path = env["PATH_INFO"]
    body = Routes[method][path] ? Routes[method][path].call : path

    [ 200, {"Content-Type" => "text/plain"}, [body] ]
  end
end

def get(path, &block)
  Routes["GET"][path] = block
end

use Logger
run App.new

#### Sinatra ####

get "/hi" do
  "Owning!"
end
