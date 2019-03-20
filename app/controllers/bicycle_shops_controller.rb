class BicycleShopsController < ApplicationController
  before_action :set_bicycle_shop, only: [:show, :edit, :update, :destroy]

  # GET /bicycle_shops
  # GET /bicycle_shops.json
  def index
    @bicycle_shops = BicycleShop.all
  end

  # GET /bicycle_shops/1
  # GET /bicycle_shops/1.json
  def show
  end

  # GET /bicycle_shops/new
  def new
    @bicycle_shop = BicycleShop.new
  end

  # GET /bicycle_shops/1/edit
  def edit
  end

  # POST /bicycle_shops
  # POST /bicycle_shops.json
  def create
    @bicycle_shop = BicycleShop.new(bicycle_shop_params)

    respond_to do |format|
      if @bicycle_shop.save
        format.html { redirect_to @bicycle_shop, notice: 'Bicycle shop was successfully created.' }
        format.json { render :show, status: :created, location: @bicycle_shop }
      else
        format.html { render :new }
        format.json { render json: @bicycle_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bicycle_shops/1
  # PATCH/PUT /bicycle_shops/1.json
  def update
    respond_to do |format|
      if @bicycle_shop.update(bicycle_shop_params)
        format.html { redirect_to @bicycle_shop, notice: 'Bicycle shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @bicycle_shop }
      else
        format.html { render :edit }
        format.json { render json: @bicycle_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bicycle_shops/1
  # DELETE /bicycle_shops/1.json
  def destroy
    @bicycle_shop.destroy
    respond_to do |format|
      format.html { redirect_to bicycle_shops_url, notice: 'Bicycle shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bicycle_shop
      @bicycle_shop = BicycleShop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bicycle_shop_params
      params.require(:bicycle_shop).permit(:name, :description, :lat, :lng)
    end
end
