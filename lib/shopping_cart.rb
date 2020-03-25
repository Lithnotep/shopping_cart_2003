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

  def products_by_category(category)
    products_of_category = []
    @products.each do |product|
      if product.category == category
        products_of_category << product
      end
    end
    return products_of_category
  end

  def details
    details = {:name => @name, :capacity => @capacity.to_i}
  end

  def percentage_occupied
    ((total_number_of_products.to_f / @capacity.to_f) * 100).round(2)
  end
end
