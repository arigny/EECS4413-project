class ProductOrdersController < ApplicationController
    before_action :set_product_order, only: %i[ show edit update destroy ]
  
    # GET /items or /items.json
    def index
      @product_order = ProductOrder.all
    end
  
    # GET /items/1 or /items/1.json
    def show
      @product_order = set_product_order
    end
  
    # GET /items/new
    def new
      @product_order = ProductOrder.new
    end
  
    # GET /items/1/edit
    def edit
    end
  
    # POST /items or /items.json
    def create
      @product_order = ProductOrder.new(product_order_params)

      if Item.exists?(bid: @product_order.bid) or ProductOrder.exists?(bid: @product_order.bid)
        # @product_order = ProductOrder.new(product_order_params)
  
        respond_to do |format|
          if @product_order.save
            format.html { redirect_to product_order_url(@product_order), notice: "Product Order was successfully created." }
            format.json { render :show, status: :created, location: @product_order }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @product_order.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|

        format.html { render :new, notice: "bid does not exist" }        
          format.json { render json: @product_order.errors, status: :unprocessable_entity }

        end
        # render :new
      end
     
    end
  
    # PATCH/PUT /items/1 or /items/1.json
    def update
      respond_to do |format|
        if @product_order.update(product_order_params)
          format.html { redirect_to product_order_url(@product_order), notice: "Product Order was successfully updated." }
          format.json { render :show, status: :ok, location: @product_order }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @product_order.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /items/1 or /items/1.json
    def destroy
      @product_order.destroy
  
      respond_to do |format|
        format.html { redirect_to product_order_url, notice: "Product Order was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product_order
        @product_order = ProductOrder.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_order_params
        params.require(:product_order).permit(:id, :bid, :quantity, :colour, :size)
    end
  end
  