require 'pry'

class ShoppingCart
attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @is_full = false
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
end
