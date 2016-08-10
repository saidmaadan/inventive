class Order < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates :quantity, presence: true
  validates :price, presence: true
  validates :total_price, presence: true
  validates :product_id, presence: true

  before_save :set_order_price

  private
    def set_order_price
      self.total_price = self.quantity * self.price
    end
end
