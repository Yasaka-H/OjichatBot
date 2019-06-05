require 'sinatra'
require 'json'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser
 
post '/show' do
  name = params[:name]

  ojistr = gen_ojichat_string(name)

  article = {
      id: 1,
      ojistr: ojistr,
  }
 
  article.to_json
end
 
post '/edit' do
  body = request.body.read
 
  if body == ''
    status 400
  else
    body.to_json
  end
end

def gen_ojichat_string(name)
  
  cmd = "ojichat #{name}"
  ojistr = `#{cmd}`

  return ojistr
end