class Router
  def initialize(&block)
    @routes = {}
    instance_eval(&block)
  end

  def match(route)
    # route: { '/' => 'home#index' }
    route.each_pair do |path, route|
      @routes[path] = route.split('#')
    end
  end

  def find(path)
    @routes[path]
  end
end
