# require Bundler
require "bundler"
Bundler.require

# require App
require ::File.join(::File.dirname(__FILE__), 'app')

map '/' do
  require ::File.join(::File.dirname(__FILE__), 'app', 'controllers', 'my_app')
  run MyApp
end

=begin
Dir.glob(::File.join(::File.dirname(__FILE__), 'app', 'controllers', '**', '*.rb')) { |file|
  name = ::File.basename(file, '.*')
  map '/' + name do
    require file
    run ::Kernel.const_get(name.camelize)
  end
}
=end
