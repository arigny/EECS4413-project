class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @brands = Item.select(:brand).distinct.order(:brand)
    @categories = Item.select(:category).distinct.order(:category)
    @colours = Item.select(:colour).distinct.order(:colour)
    selected_brands = params[:brand].presence || nil
    selected_categories = params[:category].presence || nil
    selected_colours = params[:colour].presence || nil
    selected_sorting = params[:sort].presence || 'name'

    @items = Item.all
    @items = Item.where(brand: selected_brands) if selected_brands
    @items = Item.where(category: selected_categories) if selected_categories
    @items = Item.where(colour: selected_colours) if selected_colours
    
    case selected_sorting
    when 'price_asc'
      @items = @items.order(:price)
    when 'price_desc'
      @items = @items.order(price: :desc)
    else
      @items = @items.order(:name)
    end
  end

  # GET /items/1 or /items/1.json
  def show
    @item = set_item
    @review = Review.new(item: @item)

    VisitEvent.create(
      ipaddress: '1.23.4.5',
      day: Date.current.strftime('%m%d%Y'),
      bid: @item.bid,
      eventtype: 'VIEW',
      item_id: @item.id,
    )
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:id, :bid, :name, :description, :category, :brand, :quantity, :price, :colour, :size, :weight)
  end
end
