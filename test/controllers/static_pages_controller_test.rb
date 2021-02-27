require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "ChaosWeb"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get services" do
    get services_path
    assert_response :success
    assert_select "title", "Services | #{@base_title}"
  end

  test "should get portfolio" do
    get portfolio_path
    assert_response :success
    assert_select "title", "Portfolio | #{@base_title}"
  end

  test "should get order success" do
    get success_path
    assert_response :success
    assert_select "title", "Success Order | #{@base_title}"
  end

  test "should get order cancel" do
    get cancel_path
    assert_response :success
    assert_select "title", "Cancel Order | #{@base_title}"
  end 
end
