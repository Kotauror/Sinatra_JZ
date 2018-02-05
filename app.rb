require 'sinatra'
require 'shotgun'

set :session_secret, 'super secret'
# While this is very convenient for our development process,
# it might cause problems down the line with the way Sinatra secures session
# data (you will learn about this in a later challenge).
# To avoid this pitfall, we should add the line set :session_secret, 'super secret'
# to our app.rb file.

get '/' do
   "Hello everyone" "blaaaaah"
end

get '/named-cat' do # the same as in random cat, but with params
  @name = params[:name] # we still need to set params to @name, as we use @name in  index.erb file.
  @age = params[:age]
  @color =params[:color]
  erb(:index)
end
# http://localhost:4567/named-cat?blah=James - we set @name to James.


get '/random-cat' do
  @name = ["Amigo", "Oscar", "Viking"].sample
  erb(:index)
end

get '/funny-cat' do
  @name = ["jim", "joe", "jane"].sample
  erb(:funny_cat)
end
