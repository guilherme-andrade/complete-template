class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  include Pundit

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    authorize @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    authorize @product
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)
    authorize @product

    respond_to do |format|
      if @product.save
        ProductMailer.creation_confirmation(@product).deliver_now
        format.html { redirect_to product_path(@product), notice: "#{@product.class} was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
    authorize @product
    if @product.update(product_params)
        format.html { redirect_to @product, notice: "#{@product.class} was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    authorize @product
    respond_to do |format|
      format.html { redirect_to products_url, notice: "#{@product.class} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:data_key, :data_value, :user_id, :photo)
    end
end
