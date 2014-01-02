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

  set :title, "New York State Constitution"
  set :partial_underscores, true

  assets do
    css :normalize,   ['/css/normalize.css']
    css :site,        ['/css/site.css']
    css :style,       ['/css/style.css']

    js_compression :jsmin
    css_compression :sass
  end

  get ('/') { haml :'articles/title_page' }

  article_range = ('/article_1'..'/article_20').to_a

  article_range.each do |article|
    get article do
      haml "articles#{article}".to_sym
    end
  end
end
