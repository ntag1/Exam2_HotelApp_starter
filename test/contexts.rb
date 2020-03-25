module Contexts

    def create_users
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user, first_name: "Seyda", last_name: "Bouzidi", phone: "412-369-4314")
      @user3 = FactoryBot.create(:user, first_name: "Haya", last_name: "Smith", active: false)
      @user4 = FactoryBot.create(:user, first_name: "Mazen")
    end
  
    def delete_users
      @user1.destroy
      @user2.destroy
      @user3.destroy
      @user4.destroy
    end
  
    def create_rooms
      @suite = FactoryBot.create(:room)
      @double = FactoryBot.create(:room, room_number: 200, room_type: "Double")
      @single = FactoryBot.create(:room, room_number: 300, room_type: "Single")
    end
    
    def delete_rooms
      @suite.destroy
      @double.destroy 
    end
  
  
    def create_bookings
      @suite_booking = FactoryBot.create(:booking, start_date: Date.today, end_date: 5.days.from_now.to_date, room: @suite, user: @user2)
      @double_booking = FactoryBot.create(:booking, start_date: 4.days.from_now.to_date, end_date: 9.days.from_now.to_date, room: @double, user: @user2)    
    end
    
    def delete_bookings
      @suite_booking.destroy
      @double_booking.destroy   
    end

  end
    
    