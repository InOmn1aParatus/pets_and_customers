require 'rspec'
require './lib/day_care'
require './lib/customer'
require './lib/pet'

RSpec.describe DayCare do
  context 'instantiation' do
    it 'exists' do
      day_care = DayCare.new("The Dog Spot")
      expect(day_care).to be_a(DayCare)
    end
  
    it 'has attributes' do
      day_care = DayCare.new("The Dog Spot")
      expect(day_care.name).to eq('The Dog Spot')
    end

    it 'starts with no customers' do
      day_care = DayCare.new("The Dog Spot")
      expect(day_care.customers).to eq([])
    end
  end

  context 'methods' do
    it 'can add customers' do
      day_care = DayCare.new("The Dog Spot")
      joel = Customer.new("Joel", 2)
      billy = Customer.new("Billy", 3)
      day_care.add_customer(joel)
      day_care.add_customer(billy)

      expect(day_care.customers).to eq([joel, billy])
    end

    it 'can find customer by id' do
      joel = Customer.new("Joel", 2)
      billy = Customer.new("Billy", 3)
      day_care = DayCare.new("The Dog Spot")
      day_care.add_customer(joel)
      day_care.add_customer(billy)

      expect(day_care.customer_by_id(2)).to eq(joel)
    end

    it 'can list unfed pets' do
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

      expect(day_care.unfed_pets).to eq([samson, molly])
    end
  end
end