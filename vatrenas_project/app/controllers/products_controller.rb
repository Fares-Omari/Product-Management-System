class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :authorize_admin

  # GET /products or /products.json
  def authorize_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "Access denied. Only admins can view this page."
    end
  end

  def index
    @products = Product.all
  end
  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end
  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    if @product.save
      render turbo_stream: turbo_stream.append("products_list", partial: "products/product", locals: { product: @product })
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("product_#{@product.id}", partial: "form", locals: { product: @product }) }
      end
    end
    end

  # PATCH/PUT /products/1
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("product_#{@product.id}", partial: "products/product", locals: { product: @product }) }
        format.html { redirect_to products_path }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("product_#{@product.id}", partial: "form", locals: { product: @product }) }
      end
    end
  end


  # DELETE /products/1 or /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("product_#{@product.id}") }
      format.html { redirect_to products_path, notice: 'Product was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :description, :price, :currency, :quantity, :image ])
    end
end
