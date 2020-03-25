require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  
  should have_many(:bookings)
  should have_many(:users).through(:bookings)
  
  should validate_presence_of(:room_type)
  should validate_presence_of(:room_number)  

  should allow_value(100).for(:room_number)
  should allow_value(200).for(:room_number)
  should allow_value(302).for(:room_number)
  should allow_value(405).for(:room_number)  
  should allow_value(500).for(:room_number)  
      
  should_not allow_value(-10).for(:room_number)
  should_not allow_value(0.03).for(:room_number)
  should_not allow_value(0).for(:room_number)
  should_not allow_value(99).for(:room_number)  
  should_not allow_value(1000).for(:room_number)
  should_not allow_value("test").for(:room_number)  

  should_not allow_value(nil).for(:room_number)
  
  should allow_value("Double").for(:room_type)  
  should_not allow_value(nil).for(:room_type)
  
  
  context "Within context" do
    setup do
      create_users
      create_rooms
      create_bookings
    end

    teardown do
      delete_users
      delete_rooms
      delete_bookings
    end

    should "show correct bookings" do
      b=[]
      @booked = Room.booked  
      @booked.each do |booked|
        b << booked.room_number
      end 
      assert_equal [100], b
    end
  end

end
