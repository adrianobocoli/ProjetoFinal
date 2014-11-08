require 'test_helper'

class PrincipaisControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get ajuda" do
    get :ajuda
    assert_response :success
  end

  test "should get sobre" do
    get :sobre
    assert_response :success
  end

end
