class DemonsController < ApplicationController
  # GET /demons
  # GET /demons.json
  def index
    @demons = Demon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demons }
    end
  end

  # GET /demons/1
  # GET /demons/1.json
  def show
    @demon = Demon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @demon }
    end
  end

  # GET /demons/new
  # GET /demons/new.json
  def new
    @demon = Demon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @demon }
    end
  end

  # GET /demons/1/edit
  def edit
    @demon = Demon.find(params[:id])
  end

  # POST /demons
  # POST /demons.json
  def create
    @demon = Demon.new(params[:demon])

    respond_to do |format|
      if @demon.save
        format.html { redirect_to @demon, notice: 'Demon was successfully created.' }
        format.json { render json: @demon, status: :created, location: @demon }
      else
        format.html { render action: "new" }
        format.json { render json: @demon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /demons/1
  # PUT /demons/1.json
  def update
    @demon = Demon.find(params[:id])

    respond_to do |format|
      if @demon.update_attributes(params[:demon])
        format.html { redirect_to @demon, notice: 'Demon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @demon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demons/1
  # DELETE /demons/1.json
  def destroy
    @demon = Demon.find(params[:id])
    @demon.destroy

    respond_to do |format|
      format.html { redirect_to demons_url }
      format.json { head :no_content }
    end
  end
end
