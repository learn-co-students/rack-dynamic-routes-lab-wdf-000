
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    good_path = Item.all.detect{|item| req.path.include?(item.name)}

    if req.path.include?("/items/") && good_path
        resp.status = 200
        resp.write "#{good_path.price}"
    elsif req.path.include?("/items/") && !good_path
        resp.status = 400
        resp.write "Item not found"
    else
      resp.write "Route not found"
      resp.status = 404
    end


    resp.finish
  end

end
