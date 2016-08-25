class Application

  @@items = []

  @@extra_items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      # @@items.each do |t|
      #   if t.name == item_name
      #     resp.write t.price
      #     resp.status = 200
      #   end
      # end
      object = @@items.find {|item| item.name == item_name}
      # binding.pry
      if @@items.include?(object)
        resp.write object.price
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
      # if @@items.map do |t|
      #   t.name
      #   end.include?(item_name)
      #   @@items.find {|item| item.name == }
      #   resp.status = 200
      # else
      #   resp.write "Item not found"
      #   resp.status = 400

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
