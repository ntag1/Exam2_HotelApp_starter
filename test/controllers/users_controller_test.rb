require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: {first_name: "Wafa", last_name: "Bouamor", email: "wafa.bouamor@gmail.com", phone: @user.phone, active: @user.active} }
    end
    assert_redirected_to user_url(User.last)

    post users_url, params: {user: {phone: @user.phone, active: @user.active, 
      email: @user.email, first_name: nil, last_name: @user.last_name} }
    assert_template :new

  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { active: @user.active, email:"hbouamor@qatar.cmu.edu", 
      first_name: "Houda", last_name: "Bouamor"} }
    assert_redirected_to user_url(@user)

    patch user_url(@user), params: { user: { active: @user.active, email: @user.email, 
      first_name: nil, last_name: nil }}
    assert_template :edit

  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
