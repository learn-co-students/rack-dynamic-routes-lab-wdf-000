require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include? "/items"

      name = req.path.split("items/")[1]

      counter = 0
      @@items.each do |item|
        if item.name == name
          resp.write item.price
          counter += 1
        end
      end

      if counter == 0
        resp.write "Item not found"
        resp.status = 400
      end


    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
