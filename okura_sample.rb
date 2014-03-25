require "bundler/setup"
require "sinatra/base"
require 'haml'
require 'okura/serializer'

class OkuraSample < Sinatra::Base
  get "/" do
    haml :index
  end

  post "/" do
    tagger = Okura::Serializer::FormatInfo.create_tagger('lib/okura-dic')
    @nodes = tagger.parse(request[:sentence])
    haml :index_post
  end
end
