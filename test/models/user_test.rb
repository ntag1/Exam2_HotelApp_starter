require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #test associations
  should have_many(:bookings)
  should have_many(:rooms).through(:bookings)

  # test validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)

  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)
  should_not allow_value(nil).for(:email)
  
  should allow_value("4122683259").for(:phone)
  should allow_value("412-268-3259").for(:phone)
  should allow_value("412.268.3259").for(:phone)
  should allow_value("(412) 268-3259").for(:phone)
  
  should_not allow_value("2683259").for(:phone)
  should_not allow_value("4122683259x224").for(:phone)
  should_not allow_value("800-EAT-FOOD").for(:phone)
  should_not allow_value("412/268/3259").for(:phone)
  should_not allow_value("412-2683-259").for(:phone)
  should_not allow_value(nil).for(:phone)
  
  
  # context
  context "Within context" do
      setup do
        create_users
      end

      teardown do
        delete_users
      end

      should "show that all user factories are properly created" do
        assert_equal "Ahmed Ibrahim", @user1.name
        assert_equal "Seyda Bouzidi", @user2.name
        assert_equal "Haya Smith", @user3.name
        assert_equal "Mazen Ibrahim", @user4.name
        assert @user1.active
        assert @user2.active
        assert @user4.active
        assert_not @user3.active
      end

       should "show that there are three users in alphabetical order" do
        assert_equal ["Bouzidi, Seyda", "Ibrahim, Ahmed", "Ibrahim, Mazen", "Smith, Haya"], User.alphabetical.all.map{|u| "#{u.last_name}, #{u.first_name}"}
      end

      should "show that there are only 2 atcive owners" do
        assert_equal 3, User.active.size
        assert_equal ["Ahmed", "Mazen", "Seyda"], User.active.map{|o| o.first_name}.sort
      end

      should "shows that search for owner by either (part of) last or first name works" do
        assert_equal 2, User.search("Ibr").size
        assert_equal 1, User.search("Seyda").size
        assert_equal 1, User.search("Hay").size
        assert_not_equal 3, User.search("Seyda").size
      end

    should "show that name method works" do
        assert_equal "Seyda Bouzidi", @user2.name
      end
    
    should "strip non-digits from the phone number" do
      assert_equal "4123694314", @user2.phone
      assert_not_equal "412-3694314", @user2.phone
    end
  end

end
