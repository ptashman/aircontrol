class AirqueuesController < ApplicationController
  before_action :set_airqueue, only: [:show, :edit, :update, :destroy]

  # GET /airqueues
  # GET /airqueues.json
  def index
    @airqueues = Airqueue.all
  end

  # GET /airqueues/1
  # GET /airqueues/1.json
  def show
  end

  # GET /airqueues/new
  def new
    @airqueue = Airqueue.new
  end

  # GET /airqueues/1/edit
  def edit
  end

  # POST /airqueues
  # POST /airqueues.json
  def create
    @airqueue = Airqueue.new(airqueue_params)

    respond_to do |format|
      if @airqueue.save
        format.html { redirect_to @airqueue, notice: 'Airqueue was successfully created.' }
        format.json { render :show, status: :created, location: @airqueue }
      else
        format.html { render :new }
        format.json { render json: @airqueue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airqueues/1
  # PATCH/PUT /airqueues/1.json
  def update
    respond_to do |format|
      if @airqueue.update(airqueue_params)
        format.html { redirect_to @airqueue, notice: 'Airqueue was successfully updated.' }
        format.json { render :show, status: :ok, location: @airqueue }
      else
        format.html { render :edit }
        format.json { render json: @airqueue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airqueues/1
  # DELETE /airqueues/1.json
  def destroy
    @airqueue.destroy
    respond_to do |format|
      format.html { redirect_to airqueues_url, notice: 'Airqueue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dequeue_one
    @airqueue = Airqueue.find(params[:airqueue_id])
    @airqueue.dequeue_one
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airqueue
      @airqueue = Airqueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airqueue_params
      params[:airqueue]
    end
end
