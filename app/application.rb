require 'pry'
require_relative "./item.rb"


class Application



  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last

      item = @@items.find {|each_item| each_item.name == search_term} #find works in brackets
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
