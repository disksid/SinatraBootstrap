# coding: utf-8
require 'sinatra/base'

class App < Sinatra::Base
  set :root, ::File.dirname(__FILE__)
  set :views, ::File.join(settings.root, 'app', 'views')
  set :bootstrap, '/bootstrap'

  environment_path = ::File.join(settings.root, 'config', 'environment.rb')
  require environment_path if ::File.exist? environment_path

  [
    'lib',
    ['app', 'models'],
    ['app', 'helpers'],
#    ['app', 'controllers'],
  ].each { |path|
    ::Dir.glob(::File.join(::File.dirname(__FILE__), path, '**', '*.rb')) { |file|
      require file
    }
  }

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
    alias_method :u, :escape

    def bootstrap(legacy = true)
      bootstraps = []
      bootstraps << "<link href='#{url(settings.bootstrap + '/css/bootstrap.min.css')}' rel='stylesheet'>"
      if legacy
        bootstraps << "<!--[if lt IE 9]>"
        bootstraps << "<script src='#{url(settings.bootstrap + '/js/html5shiv.js')}'></script>"
        bootstraps << "<script src='#{url(settings.bootstrap + '/js/respond.min.js')}'></script>"
        bootstraps << "<![endif]--> "
      end
      bootstraps << "<script src='#{url(settings.bootstrap + '/js/jquery.min.js')}'></script>"
      bootstraps << "<script src='#{url(settings.bootstrap + '/js/bootstrap.min.js')}'></script>"
      bootstraps.join($/)
    end
  end
end
