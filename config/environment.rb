require 'sequel'
require 'erb'

class App < Sinatra::Base
  enable :sessions
  enable :logging
  enable :method_override

  Sequel::Model.plugin(:schema)

  configure :production do
    Sequel.connect('sqlite://production.db')
  end

  configure :development do
    enable :dump_errors
    Sequel.connect('sqlite://development.db')
  end
end
