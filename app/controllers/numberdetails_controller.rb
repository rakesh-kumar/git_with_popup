class NumberdetailsController < ApplicationController
  # GET /numberdetails
  # GET /numberdetails.json
  def search
    @numberdetails = Numberdetail.search params[:term]
  end

  def index
    #debugger
     @numberdetails = Numberdetail.search(params[:search])
     #@numberdetail=Numberdetail.all
     #@serverprovider =Serverprovider.all
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @numberdetails }
    # end
  end

  # GET /numberdetails/1
  # GET /numberdetails/1.json
  def show
    @demons=Demon.for_dashboard
    @demons_count =Demon.count
    @demon_total_word_count=Demon.total_word_count
  
    # @numberdetail = Numberdetail.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @numberdetail }
    # end
  end

  # GET /numberdetails/new
  # GET /numberdetails/new.json
  def new
    #debugger
    @numberdetail = Numberdetail.new
    #@serverprovider =@numberdetail.serverproviders.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @numberdetail }
    end
  end

  # GET /numberdetails/1/edit
  def edit
    @numberdetail = Numberdetail.find(params[:id])
  end

  # POST /numberdetails
  # POST /numberdetails.json
  def create
    @numberdetail = Numberdetail.new(params[:numberdetail])
    #@serverprovider =@numberdetail.serverproviders.build(params[:serverprovider])
    

    respond_to do |format|
      if @numberdetail.save
        format.html { redirect_to @numberdetail, notice: 'Numberdetail was successfully created.' }
        format.json { render json: @numberdetail, status: :created, location: @numberdetail }
      else
        format.html { render action: "new" }
        format.json { render json: @numberdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /numberdetails/1
  # PUT /numberdetails/1.json
  def update
    @numberdetail = Numberdetail.find(params[:id])

    respond_to do |format|
      if @numberdetail.update_attributes(params[:numberdetail])
        format.html { redirect_to @numberdetail, notice: 'Numberdetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @numberdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numberdetails/1
  # DELETE /numberdetails/1.json
  def destroy
    @numberdetail = Numberdetail.find(params[:id])
    @numberdetail.destroy

    respond_to do |format|
      format.html { redirect_to numberdetails_url }
      format.json { head :no_content }
    end
  end
  def home
  end
  def maurya
    respond_to do |format|
      format.js
    end
  end
end
