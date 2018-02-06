# Into the Web

## HTTP HEADERS (ex. 2)

```plain
$ brew install httpie
```
```plain
$ http <address> - gives you info about website.
```
```plain
$ http -v <address> - gives you info about website and the request at the beginning
```
### request line:
```plain
GET /tutorials/other/top-20-mysql-best-practices/ HTTP/1.1
Host: net.tutsplus.com
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729)
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive: 300
Connection: keep-alive
Cookie: PHPSESSID=r2t5uvjq435r4q7ib3vtdjq120
Pragma: no-cache
Cache-Control: no-cache
```

first line of GET:
The "method" indicates what kind of request this is. Most common methods are GET, POST and HEAD.
The "path" is generally the part of the url that comes after the host (domain). For example, when requesting "http://net.tutsplus.com/tutorials/other/top-20-mysql-best-practices/" , the path portion is "/tutorials/other/top-20-mysql-best-practices/".
The "protocol" part contains "HTTP" and the version, which is usually 1.1 in modern browsers.

### response line:
```plain  
HTTP/1.x 200 OK
Transfer-Encoding: chunked
Date: Sat, 28 Nov 2009 04:36:25 GMT
Server: LiteSpeed
Connection: close
X-Powered-By: W3 Total Cache/0.8
Pragma: public
Expires: Sat, 28 Nov 2009 05:36:25 GMT
Etag: "pub1259380237;gz"
Cache-Control: max-age=3600, public
Content-Type: text/html; charset=UTF-8
Last-Modified: Sat, 28 Nov 2009 03:50:37 GMT
X-Pingback: http://net.tutsplus.com/xmlrpc.php
Content-Encoding: gzip
Vary: Accept-Encoding, Cookie, User-Agent
```
first line of response:
The first piece of data is the protocol. This is again usually HTTP/1.x or HTTP/1.1 on modern servers.

The rest of the response contains headers just like the HTTP request. These values can contain information about the server software, when the page/file was last modified, the mime type etc...

Again, most of those headers are actually optional.

HTTP Status Codes
200's are used for successful requests.
300's are for redirections.
400's are used if there was a problem with the request.
500's are used if there was a problem with the server.

```plain
2xx: Successful
This tells the client that the request was successfully processed. The most common code is 200 OK. For a GET request, the server sends the resource in the message body. There are other less frequently used codes:

202 Accepted: the request was accepted but may not include the resource in the response. This is useful for async processing on the server side. The server may choose to send information for monitoring.
204 No Content: there is no message body in the response.
205 Reset Content: indicates to the client to reset its document view.
206 Partial Content: indicates that the response only contains partial content. Additional headers indicate the exact range and content expiration information.

3xx: Redirection
This requires the client to take additional action. The most common use-case is to jump to a different URL in order to fetch the resource.

301 Moved Permanently: the resource is now located at a new URL.
303 See Other: the resource is temporarily located at a new URL. The Location response header contains the temporary URL.
304 Not Modified: the server has determined that the resource has not changed and the client should use its cached copy. This relies on the fact that the client is sending ETag (Enttity Tag) information that is a hash of the content. The server compares this with its own computed ETag to check for modifications.

4xx: Client Error
These codes are used when the server thinks that the client is at fault, either by requesting an invalid resource or making a bad request. The most popular code in this class is 404 Not Found, which I think everyone will identify with. 404 indicates that the resource is invalid and does not exist on the server. The other codes in this class include:

400 Bad Request: the request was malformed.
401 Unauthorized: request requires authentication. The client can repeat the request with the Authorization header. If the client already included the Authorization header, then the credentials were wrong.
403 Forbidden: server has denied access to the resource.
405 Method Not Allowed: invalid HTTP verb used in the request line, or the server does not support that verb.
409 Conflict: the server could not complete the request because the client is trying to modify a resource that is newer than the client's timestamp. Conflicts arise mostly for PUT requests during collaborative edits on a resource.

5xx: Server Error
This class of codes are used to indicate a server failure while processing the request. The most commonly used error code is 500 Internal Server Error. The others in this class are:

501 Not Implemented: the server does not yet support the requested functionality.
503 Service Unavailable: this could happen if an internal system on the server has failed or the server is overloaded. Typically, the server won't even respond and the request will timeout.

```
### content:
```plain  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Top 20+ MySQL Best Practices - Nettuts+</title>
<!-- ... rest of the html ... -->
```

see https://code.tutsplus.com/tutorials/http-headers-for-dummies--net-8039 for more


## HTTP PARAMETERS (ex.3)

http://www.example.com/home?name=Bob&age=21.
```plain
http://www.example.com/home
```
address
```plain
?
```
separator
```plain  
?name=Bob&age=21
```
the query string  
* It contains two parameters, "name=Bob" and "age=21".
The two parameters are separated by an ampersand ("&").
The keys are "name", and "age". They have the values "Bob" and "21" respectively.

A MORE COMPLICATED EXAMPLE :)

```plain
https://video.googleco.uk:80/videoplay?docid=-37583789582905837825792&hl=en#00h02m30s
```
`https://` - protocol
`video` - subdomain
`google.co.uk` - domain
`:80` - port ()
*By default HTTP Server runs on port number `80`. But if you are running a server on any other port number then it can be porvided as follows, assuming server is running on port `8080`. For https (secure) requests port `443` is used.*
`videoplay` - path: typically refers to a file or directory on the web server
`?` - separator - query
*A query is commonly found in the URL of dynamic pages (ones which are generated from database or user-generated content) and is represented by a question mark followed by one or more parameters. The query directly follows the domain name, path or port number.*
*For example, have a look at this URL which was generated by Google when doing a search for the word URL:* http://www.google.co.uk/search?q=url&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-GB:official&client=firefox-a `?q=url&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-GB:official&client=firefox-a` - query part

`docid=-37583789582905837825792&hl=en` - two pairs of key&value parameters, separated by &. The parameters follow the question mark and are separated by an ampersand (&) character so they can be understood individually and used to display content on that page.
`#00h02m30s` - specific fragment

## HTTP VERBS (ex. 4)

These request verbs are:

```plain
GET: fetch an existing resource. The URL contains all the necessary information the server needs to locate and return the resource.
POST: create a new resource (send new information and make changes). POST requests usually carry a payload that specifies the data for the new resource.
PUT: update an existing resource. The payload may contain the updated data for the resource.
PATCH: update an existing resource.
DELETE: delete an existing resource (delete record that you've made in the past).
The above four verbs are the most popular, and most tools and frameworks explicitly expose these request verbs. PUT and DELETE are sometimes considered specialized versions of the POST verb, and they may be packaged as POST requests with the payload containing the exact action: create, update or delete.
```
There are some lesser used verbs that HTTP also supports:
```plain
HEAD: this is similar to GET, but without the message body. It's used to retrieve the server headers for a particular resource, generally to check if the resource has changed, via timestamps - only header, not interested in body (when interested only in server)
TRACE: used to retrieve the hops that a request takes to round trip from the server. Each intermediate proxy or gateway would inject its IP or DNS name into the Via header field. This can be used for diagnostic purposes.
OPTIONS: used to retrieve the server capabilities (all available request types). On the client-side, it can be used to modify the request based on what the server can support.
```
http -f POST https://getpostworkout.herokuapp.com/ name=Just
-f - saves Just to a website
```plain
MacBook-Air-Kot:Note_-from_MA kotpsot http -f POST https://getpostworkout.herokuapp.com/ name=Just
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 38
Content-Type: text/html;charset=utf-8
Date: Mon, 05 Feb 2018 14:10:14 GMT
Server: WEBrick/1.3.1 (Ruby/2.0.0/2015-04-13)
Via: 1.1 vegur
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block

<p>Your name, Just has been saved!</p>
```


http -v POST https://getpostworkout.herokuapp.com/ name=Juuuust
-v doesn't save name to the website, only shows where Juuuust would be put.

Verbose output. Print the whole request as well as the response. Also print
      any intermediary requests/responses (such as redirects).
      It's a shortcut for: --all --print=HhbB

```plain
http -v POST https://getpostworkout.herokuapp.com/ name=Juuuust
POST / HTTP/1.1
Accept: application/json, */*
Accept-Encoding: gzip, deflate
Connection: keep-alive
Content-Length: 19
Content-Type: application/json
Host: getpostworkout.herokuapp.com
User-Agent: HTTPie/0.9.9

{
    "name": "Juuuust"
}

HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 34
Content-Type: text/html;charset=utf-8
Date: Mon, 05 Feb 2018 14:10:31 GMT
Server: WEBrick/1.3.1 (Ruby/2.0.0/2015-04-13)
Via: 1.1 vegur
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block

<p>Your name,  has been saved!</p>
```

http -f -v POST https://getpostworkout.herokuapp.com/ name=Ptolemy

## ex. 5 Sinatra

```plain
$ gem install sinatra
```
```plain
$ bundle init
```
creates gemfile. Inside of it, require sinatra gem.

## ex. 6 defining a route

inside app.rb file:

```ruby

require 'sinatra'

get '/home' do
  "Hello Worlddddd"
end


get '/justa' do
  "Hellojiewjiowhgieh8wioulddddd"
end
```
So home and justa are routes. I can access them by typing:
http://localhost:4567/justa
http://localhost:4567/home


## ex. 7 start and restart

gem shotgun - you don't have to refrest page.
```plain
gem install shotgun
```
then run app
```plain
shotgun app.rb
```
and go to the port displayed (eg. http://127.0.0.1:9393/)
instead of
```plain
ruby app.rb
```
and go to the port displayed (eg. http://localhost:4567//)


!!!!! NOTE ON GEMFILE (thanks Steve :P )!!!!
So the Gemfile is not for us but for other people using our programs. Gems are installed on our machine as a whole, so - for our purpose - we don't have to have a gemfile. Gemfile is usefull for other people using our programs - they can see what gems needs to be used and install them.

```plain
shotgun app.rb -p 4567
```

force shotgun to use 4567 port.
Thanks to this we can use shotgun using our familiar localhost:4567 instead of
127.0.0.1:9393.

## ex. 8 returning html

## ex. 9 views

.erb - extension for view files.

inside app.rb
```ruby
get '/cat' do
  erb(:index)
end
```
it says that on /cat website, load code from index.erb file.
This file is stored in views directory.

## ex. 10 sinatra erb

erb is very powerful. It is part of the Ruby Standard Library. When passed a regular string, erb will do nothing: in Sinatra, running erb("a string") will simply return "a string".

The power of ERB comes when you include the following symbols: `<%= %>` somewhere in a string. Any Ruby expression within those 'braces' will be evaluated, and then interpolated into the string.

Here is an example of both situations.
```plain

# within a Sinatra route

erb "Hi there, Visitor!"
# => "Hi there, Visitor!"

erb "Hi there, Visitor <%= 2 + 2 %>!"
# => "Hi there, Visitor 4!"
```
If you omit the `=` on the first of the 'ERB tags', the expression will be evaluated but not interpolated into the string:
```plain
# within a Sinatra route

erb "Hi there, Visitor <% 2 + 2 %>!"
# => "Hi there, Visitor!"
```

## ex. 11keeping views clean

Our presentation layer should not be cluttered with this kind of randomising logic. Rule of thumb: view logic should be limited to:

- Light Conditionals (i.e. if and else), and
- Light Iterators (i.e. each).

We move ruby logic from index.erb to app.rb (controller).
```ruby
get '/cat' do
  @name = ["Amigo", "Oscar", "Viking"].sample
  erb(:index)
end
```
Then use the `@name` variable in view (index.erb) :
```erb
<h1> My name is <%= @name %> </h1>
```
!!!
The @name instance variable is only accessible within the scope of the route in which is was defined. In other words, you cannot visit /cat to set @name, and then visit another route that uses that same @name. The instance variable cannot be accessed by any other routes.
!!!

## ex. 12 Introducing params

Inside app.rb
```ruby
get '/named-cat' do
  @name = params[:name] #  
  erb(:index)
end
```
params works like a hash - inside the url we need to set the key name to a value.

Furthermore, we still need to set the key value pair to @name, as we use @name in index.erb file.

In the browser URL, add the following query string after the `/named-cat` path: `?name=James`.

In this way, we fill the @name with James.

`params[:kotkotkot]` is the thing provided in URL.


Inside the controller (app.rb) we have two kinds of cats: random and named

```ruby
get '/named-cat' do
  @name = params[:name]
  @age = params[:age]
  erb(:index)
end

get '/random-cat' do
  @name = ["Amigo", "Oscar", "Viking"].sample
  erb(:index)
end
```

They both use the same index file

```plain
<h1> My name is <%= @name %> </h1>
<h1> I'm <%= @age %> </h1>

<div style='border: 3px dashed red'>
   <img src='http://bit.ly/1eze8aE'>
 </div>
```

Since only the named cat has an age, we don't want to display I'm age..  for the random cat.

To do that, we need to change index.erb file in the following way:

```plain
<h1> My name is <%= @name %> </h1>
<% if @age %>
<h1> I'm <%= @age %> </h1>
<% end %>

<div style='border: 3px dashed red'>
   <img src='http://bit.ly/1eze8aE'>
 </div>
 ```
According to this file, if age is provided, it will be displayed, otherwise not.

 Because we don't want to output the results of the if statement, that is, line 2 into the HTML, we don't put = after the opening tag or the closing tag.

 ## ex. 13 Using forms

 ```html
 <div style='border: 3px dashed red'>
    <img src='http://bit.ly/1eze8aE' style='margin-left: auto; margin-right: auto; display: block;'>
    <form action="/named-cat">
      <input type="text" name="name">
      <input type="submit" value="Submit">
    </form>
  </div>
```

the `<input type="text" name="name">` fills the query string in URL.

```html
<div style='border: 3px dashed red'>
   <img src='http://bit.ly/1eze8aE' style='margin-left: auto; margin-right: auto; display: block;'>
 </div>
<% if !@name %>
 <form action="/named-cat">
   <input type="text" name="name">
   <input type="submit" value="Submit">
 </form>
<% end %>
```
Divide the code into two sections - image and form. The form will be displayed only in case the user doesn't put the name in the URL.

// not rly posting anything, just filling the query in URL.

## ex. 14 POSTed params
```plain
127.0.0.1 - - [06/Feb/2018:11:45:43 +0000] "GET /named-cat?name=KOT&age=5&color=blue HTTP/1.1" 200 209 0.0217
```
example of log in GET.
```html
<form action="/named-cat">
  <input type="text" name="age">
  <input type="submit" value="Submit">
</form>
```

whatever we post in the form, it will be redirected to the /named-cat route.

```html
<form action="/named-cat" method="post">
  <input type="text" name="age">
  <input type="submit" value="Submit">
</form>
```
By default, forms send the GET request. In order to change it to POST request, we need to change the method to post.  

```ruby
post '/named-cat' do # the same as in random cat, but with params
  p params
  @name = params[:name] # we still need to set params to @name, as we use @name in  index.erb file.
  @age = params[:age]
  @color =params[:color]
  erb(:index)
end
```
Since we're using the post method, we need to mae change to router (get --> post)

RIght now localhost:4567/named-cat is not accessible because of the post method. We can access this page only after we make a post request directed to this route. Whenever we want to get to named-cat, we need to do it through post request.

//// because of the fact that the name was provided in the form, there is no query string. 
