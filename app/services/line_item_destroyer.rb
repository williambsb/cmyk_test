class LineItemDestroyer

  class Result < Struct.new :success

    def success?
      success == true
    end

  end

  def initialize cart:, line_item_id:
    @cart = cart
    @line_item_id = line_item_id
  end

  # TODO: rescue error
  def call
    delete_item
    Result.new true
  end

  def delete_item

    to_delete = @cart
      .line_items
      .where(
        id: @line_item_id,
      )

    to_delete
        .first
        .quantity < 2 ? to_delete.destroy_all :

      to_delete
          .first
          .quantity -= 1
  end

  # &&
    # image_identifier(li.image_id) ==
    # image_identifier(@image_id)

  # def image_identifier image_id
  #   Image.find(image_id).files.map(&:identifier)
  # end

end
