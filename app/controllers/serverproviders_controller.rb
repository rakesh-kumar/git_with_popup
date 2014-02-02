class ServerprovidersController < ActionController::Base
	def index
	end
	def new
		@serverprovider=Serverprovider.new
	end
	def create
		@serverprovider=Serverprovider.new(params[:serverprovider])

		respond_to do |format|
	      if @serverprovider.save
	        format.html { redirect_to @serverprovider, notice: 'serverprovider was successfully created.' }
	        format.json { render json: @serverprovider, status: :created, location: @serverprovider }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @serverprovider.errors, status: :unprocessable_entity }
	      end
	    end

	end
end