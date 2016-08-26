require 'pry'
require_relative "./item.rb"


class Application



  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last

      item = @@items.find {|each_item| each_item.name == search_term}
        if !item
          resp.write "Item not found"
          resp.status = 400
        else
          resp.write item.price.to_s
          resp.status = 200
        end

    else
        resp.write "Route not found"
        resp.status = 404
    end
    resp.finish

  end

end

#so explain everything to yourself top to bottom

#call(env) is calling the request we receieve from the cilent to the server
#we created a new response resp = Rack::Response.new and we
#created a new request this the request is passed with an argument of the
#request itself req = Rack::Request.new(env)
#if the require path is requesting items then we create a var that equals
#to any response we split the items path which is a string at the moment
#and we grab the last bit of that string. This is accomplished through regex
#rememeber the find emu is better for this case because you are trying to locate one
#object on top of that the format used above is ideal for the find emu.
#find returns the correct item which matches the comparison.
#I then start my if else statement

#****** revisted today********
# REMEMBER IF ELSE STATEMENTS RETURN TRUE OR FALSE
#so if the we have return value of a correct name corresponding and we place a not !search_term
#then we write the item is not found and we pass a 400 error
#else we return the item price as a string and set the response status to 200 meaning
#request send and response accepted and succesfull its how the browser communicate with both the
#browser and the human.
#else we say the route is not found, it does not exist in the browser. browser was unable to locate route.
#and then we finish off the response.
