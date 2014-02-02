class ApplicationController < ActionController::Base
  protect_from_forgery
  

  def num_search
  puts "eeeeeeeeeeeeeeeeeeeeeeeeee#{params.inspect}"
  	q= "%#{params[:term]}%"
  	@numberdetails =Numberdetail.where("details like ?", q )
  	@tag_hash= []
  	@numberdetails.each do |num|
  		@tag_hash << num.details.to_json.gsub('"', '').gsub(':', ' , ').gsub('{', '').gsub('}', '')
  		#@tag_hash << num.amount.to_json
  	end
  	render :json =>@tag_hash


  end
end
