require 'test_helper'

class EstaticasControllerTest < ActionController::TestCase
  test "should get ajuda" do
    get :ajuda
    assert_response :success
  end

  test "should get sobre" do
    get :sobre
    assert_response :success
  end

  test "should get contato" do
    get :contato
    assert_response :success
  end

end
