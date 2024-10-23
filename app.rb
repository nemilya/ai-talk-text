require 'sinatra'
require 'yaml'

config = YAML.load_file('config.yml')

# Basic Authentication
use Rack::Auth::Basic, "Protected Area" do |username, password|
  username == config['username'] && password == config['password']
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

