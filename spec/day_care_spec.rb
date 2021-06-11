require 'minitest/autorun'
require 'minitest/pride'
require './lib/day_care'
require './lib/customer'
require './lib/pet'

class DayCareTest < Minitest::Test
  def test_it_exists
    day_care = DayCare.new("The Dog Spot")
    assert_instance_of DayCare, day_care
  end

  def test_it_has_a_name
    day_care = DayCare.new("The Dog Spot")
    assert_equal "The Dog Spot", day_care.name
  end

  def test_it_starts_with_no_customers
    day_care = DayCare.new("The Dog Spot")
    assert_equal [], day_care.customers
  end

  def test_it_can_add_customers
    day_care = DayCare.new("The Dog Spot")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)
    day_care.add_customer(joel)
    day_care.add_customer(billy)
    assert_equal [joel, billy], day_care.customers
  end

  def test_it_can_list_unfed_pets
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 3)
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)
    day_care = DayCare.new("The Dog Spot")
    day_care.add_customer(joel)
    day_care.add_customer(billy)
    lucy.feed

    assert_equal [samson, molly], day_care.unfed_pets
  end

  def test_it_can_find_customer_by_id
    joel = Customer.new("Joel", 2)
    joel.charge(10)
    billy = Customer.new("Billy", 3)
    day_care = DayCare.new("The Dog Spot")
    day_care.add_customer(joel)
    day_care.add_customer(billy)
    assert_equal joel, day_care.customer_by_id(2)
  end
end
