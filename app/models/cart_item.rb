class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # def get_item_image(width,height)
  #     item.image.variant(resize_to_limit: [width, height]).processed
  # end

  def add_tax_price
        (self.price * 1.1).round
  end



end
