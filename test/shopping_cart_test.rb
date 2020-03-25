require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
 def test_it_exists
   cart = ShoppingCart.new("King Soopers", "30items")
   assert_instance_of ShoppingCart, cart
 end

 def test_shopping_cart_var
   cart = ShoppingCart.new("King Soopers", "30items")

   assert_equal "King Soopers", cart.name
   assert_equal "30items", cart.capacity
   assert_equal [], cart.products
 end

 def test_can_add_products
   cart = ShoppingCart.new("King Soopers", "30items")
   product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
   product2 = Product.new(:meat, 'chicken', 4.50, '2')

   assert_equal [], cart.products
   cart.add_product(product1)
   cart.add_product(product2)
   assert_equal [product1, product2], cart.products
 end

 def test_can_count_products
   cart = ShoppingCart.new("King Soopers", "30items")
   product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
   product2 = Product.new(:meat, 'chicken', 4.50, '2')
   product3 = Product.new(:paper, 'tissue paper', 1.25, '1')


   cart.add_product(product1)
   cart.add_product(product2)
   cart.add_product(product3)

   assert_equal 13, cart.total_number_of_products
 end

 def test_can_fill_cart
   cart = ShoppingCart.new("King Soopers", "30items")
   product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
   product2 = Product.new(:meat, 'chicken', 4.50, '2')
   product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
   product4 = Product.new(:produce, 'apples', 0.99, '20')

   cart.add_product(product1)
   cart.add_product(product2)
   cart.add_product(product3)
   assert_equal false, cart.is_full?
   cart.add_product(product4)
   assert_equal true, cart.is_full?
  end

  def test_products_by_category
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal [product1, product3], cart.products_by_category(:paper)
  end
end
