require 'active_record'
require 'app/models/user'

class UsersController < ApplicationController
  def index
    User.all.each { |user| response.write("<p>#{user.name}</p>") }
  end
end
