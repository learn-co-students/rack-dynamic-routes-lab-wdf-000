class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      requested_item = req.path.split("/").last
      item = @@items.find do |item_obj|
        item_obj.name == requested_item
      end

      # First check for a nil value which is what will return rom the @@item.find if not found
      if item == nil
        resp.write "Item not found"
        resp.status = 400

      # Else item was found, so we just want it's price attribute
      else
        resp.write item.price
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
