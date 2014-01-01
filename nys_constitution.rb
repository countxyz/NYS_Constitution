require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/assetpack'
require 'sinatra/support'
require 'haml'
require 'sass'
require 'compass'

class NysConstitution < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::AssetPack
  register Sinatra::CompassSupport

  set :partial_underscores, true

  assets do

    js_compression :jsmin
    css_compression :sass
  end

  get "/" do
    haml :index
  end
end