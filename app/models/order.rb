class Order < ActiveRecord::Base
  belongs_to :cart
end
