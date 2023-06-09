class PoItemsController < ApplicationController
  before_action :set_po_item, only: %i[ show edit update destroy ]

  # GET /po_items or /po_items.json
  def index
    @po_items = PoItem.all
    @grouped_po_items = @po_items.group_by { |po_item| po_item.slice(:bid, :name, :price) }.map { | k, v| {attributes: k, count: v.count} }
    @subtotal = @po_items.map(&:price).sum
    @grandtotal = @subtotal + @po_items.count
  end

  # GET /po_items/1 or /po_items/1.json
  def show
  end

  # GET /po_items/new
  def new
    @po_item = PoItem.new
    VisitEvent.create(
      ipaddress: '1.23.4.5',
      day: Date.current.strftime('%m%d%Y'),
      bid: @po_item.bid,
      eventtype: 'CART',
      item_id: @po_item.item_id,
    )
  end

  # GET /po_items/1/edit
  def edit
  end

  # POST /po_items or /po_items.json
  def create
    @po_item = PoItem.new(po_item_params)
      respond_to do |format|
        if @po_item.save
          format.html { redirect_to po_item_url(@po_item), notice: "Po item was successfully created." }
          format.json { render :show, status: :created, location: @po_item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @po_item.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /po_items/1 or /po_items/1.json
  def update
    respond_to do |format|
      if @po_item.update(po_item_params)
        format.html { redirect_to po_item_url(@po_item), notice: "Po item was successfully updated." }
        format.json { render :show, status: :ok, location: @po_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @po_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /po_items/1 or /po_items/1.json
  def destroy
    @po_item.destroy

    respond_to do |format|
      format.html { redirect_to po_items_url, notice: "Shopping cart item is removed." }
      format.json { head :no_content }
    end
  end

  def duplicate
    po_item = PoItem.find(params[:id])
    duplicated_po_item = po_item.dup
    if duplicated_po_item.save
      redirect_to po_items_path, notice: 'Item was added successfully'
    else
      redirect_to po_items_path, alert: 'An error occured while duplicating the item'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_po_item
      @po_item = PoItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def po_item_params
      params.require(:po_item).permit(:id, :bid, :name, :price, :quantity, :purchase_order_id, :item_id)
    end
end
