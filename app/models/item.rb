class Item < ApplicationRecord
   has_one_attached :image

   has_many :cart_items, dependent: :destroy
   has_many :ordering_details, dependent: :destroy
   belongs_to :genre

   def add_tax_price
        (self.price * 1.1).round
   end

   def get_item_image(width,height)
      image.variant(resize_to_limit: [width, height]).processed
   end
end

