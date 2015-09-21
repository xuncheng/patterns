class HomeController < ApplicationController
  def index
    response.write "hello from home controller"
  end
end
