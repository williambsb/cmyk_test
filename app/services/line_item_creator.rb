class LineItemCreator

  class Result < Struct.new :success, :error

    def success?
      success == true
    end

    def error
      error
    end

  end

  def initialize cart:, product:, image:, options:
    @cart = cart
    @product = product unless product.nil?
    @image = image
    @options = options unless options.nil?
  end

  def find_variant
    @product.variants.each do |variant|
      @variant = variant if (@options.to_h.to_a - variant.attributes.to_a).empty?
    end
  end

  def call
    find_variant
    create_images
    #
    line_items = @images.map {|im| LineItem.create!(
      cart: @cart,
      shopify_variant_id: @variant.id,
      quantity: 1,
      image_id: im.id,
      shopify_product_id: @product.id
      )
    }
    @cart.line_items ||= []
    line_items.each { |li| add_item li }
    # sanity check
    # @cart.line_items.reject! {|li| li.variant_id == nil}
    Result.new true
  rescue ActiveRecord::RecordInvalid => error
    Result.new false, error
  end

  def from_cart
    create_images
    line_items = @images.map { |im| LineItem.create!(
      cart: @cart,
      shopify_variant_id: ShopifyAPI::Variant.first.id,
      quantity: 1,
      image_id: im.id,
      shopify_product_id: ShopifyAPI::Product.first.id
      )
    }
    @cart.line_items ||= []
    line_items.each { |li| @cart.line_items << li }
    Result.new true
  rescue ActiveRecord::RecordInvalid => error
    Result.new false, error
  end

  def create_images
    @images = @image[:files].map {|f| Image.create! files: [f]}
  end

  def add_item line_item
    to_add = @cart.line_items.where(
      shopify_variant_id: line_item.shopify_variant_id,
      image_id: line_item.image_id
    )

    if !to_add.empty?

      to_add
        .first
        .quantity += 1
    else
      @cart.line_items << line_item
    end

  end

end
