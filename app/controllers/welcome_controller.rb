class WelcomeController < ApplicationController

include ApplicationHelper

require 'open-uri'
require 'json'

	def home
	end

  def radioselect
  	@stations = ["North Springs", "Hamilton E. Holmes", "Lindbergh", "Midtown", "Georgia State", "Reynoldstown/Inman Park", "Dunwoody", "Lenox", "Sandy Springs", "Medical Center", "Doraville", "Chamblee", "Brookhaven/Oglethorpe", "Arts Center", "North Avenue", "Civic Center", "Ashby", "Peachtree Center", "Vine City", "West End", "Airport", "College Park", "East Point", "Philips Arena/CNN Center", "Garnett", "West Lake", "Bankhead", "Oakland City", "Lakewood/Ft. McPherson", "King Memorial", "Avondale", "East Lake", "Kensington", "Decatur", "Indian Creek", "Edgewood/Candler Park", "Inman Park/Reynoldstown", "Buckhead"]
  	@stations = @stations.sort_by{|item| item.downcase}
  end

  def yourbuses
    @station = params[:station]
	   @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)
	   hash_and_msg_generator(@results, @station)
  end

  def yourbuses_dropdown
	yourstation = Selection.last
	@selection = yourstation.station_name
	@results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)
	hash_and_msg_generator(@results, @selection)
  end
end
