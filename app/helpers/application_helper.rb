module ApplicationHelper
	def hash_and_msg_generator(results, station)
		@message = ""
		@buses = {}
	results.each do |result|
		if result["TIMEPOINT"].include? station.to_s
			@buses[result["ROUTE"]] = result["VEHICLE"]
			end
		end
		if @buses.count == 0
				@message = "Sorry, it's gonna be a while."
		elsif @buses.count == 1
				@message = "A bus is on it's way!"
		elsif @buses.count > 1
				@message = "These buses will be coming soon:"
		else
				@message = "Oops...I think there was a slight error."
		end
	end
end