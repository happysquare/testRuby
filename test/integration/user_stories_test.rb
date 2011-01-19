require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :all
  
  test "should login user and redirect" do
    get login_path
    
    assert_response :success
    assert_template 'new'
    
    post session_path, :email => 'james@happysquare.com.au', :password => 'soph22'
    
    assert_response :redirect
    assert_redirected_to root_path
    
    follow_redirect!
    
    assert_response :success
    assert_template 'index'
    assert session[:user_id]
  end
  
  
end
