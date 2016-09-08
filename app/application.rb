class Application
  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      i= req.path.split("/items/").last
      itemz = @@items.find{|item| item.name == i}
      if  itemz
      resp.write "#{itemz.price}"
    else
      resp.write "Item not found"
      resp.status = 400
    end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
