class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :through => :cart_items
  has_one :order

  def make_order(params)
    @order = Order.create(params)
    @order.cart_id = self.id
    @order.save
    self.blocked = true
    self.save
  end

end
