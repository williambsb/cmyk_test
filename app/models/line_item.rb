class LineItem < ApplicationRecord
  belongs_to :cart

  attr_accessor :product_id

end
