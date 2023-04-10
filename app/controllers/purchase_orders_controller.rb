class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: %i[ show edit update destroy ]

  # GET /purchase_orders or /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1 or /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders or /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    # current_po_items = PoItem.where(purchase_order_id: @purchase_order_id)
    current_po_items = PoItem.all

    respond_to do |format|
      if @purchase_order.save
        if @purchase_order.status == "ORDERED"
          current_po_items.destroy_all
        end

        flash[:notice] = @purchase_order.status == "DENIED" ? 'Transaction denied.' : ''
        format.html { redirect_to purchase_order_url(@purchase_order), notice: "Purchase order was successfully created." }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1 or /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to purchase_order_url(@purchase_order), notice: "Purchase order was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1 or /purchase_orders/1.json
  def destroy
    @purchase_order.destroy

    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: "Purchase order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_params
      params.require(:purchase_order).permit(:id, :lname, :fname, :status, :address_id, :credit_card_number)
    end
end
