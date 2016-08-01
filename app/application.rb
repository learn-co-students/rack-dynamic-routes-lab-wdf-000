class Application

	@@items = []

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)

		if req.path.match(/items/)
			item = req.path.split("/items/").last
			price = @@items.find do |x|
				x.name == item
			end
			if price == nil
				resp.write "Item not found"
				resp.status = 400
			else
				resp.write price.price
			end
		elsif
			resp.write "Route not found"
			resp.status = 404
		end

		resp.finish
	end

end

