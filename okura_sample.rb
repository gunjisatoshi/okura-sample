require "bundler/setup"
require "sinatra/base"
require 'haml'
require 'okura/serializer'

TAGGER = Okura::Serializer::FormatInfo.create_tagger('lib/okura-dic')

class OkuraSample < Sinatra::Base
  get "/" do
    haml :index
  end

  post "/" do
    @nodes = TAGGER.parse(request[:sentence])
    haml :index_post
  end
end
