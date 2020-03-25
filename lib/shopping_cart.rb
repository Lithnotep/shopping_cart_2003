require 'pry'

class ShoppingCart
attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    product_total = 0
    @products.each do |product|
      product_total += product.quantity.to_i
    end
    return product_total
  end

  def is_full?
    if total_number_of_products >= @capacity.to_i
      true
    else
      false
    end
  end
end
