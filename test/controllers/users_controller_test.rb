require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @use        = users(:hacker)
    @other_user = users(:coder)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email,
                                              tel: @user.tel,
                                              adr: @user.adr,
                                              cty: @user.cty,
                                              ste: @user.ste,
                                              zip: @user.zip,
                                              web_type: @user.web_type,
                                              hosting_type: @user.hosting_type,
                                              security_type: @user.security_type,
                                              date_started: @user.date_started,
                                              date_completed: @user.date_completed,
                                              order_total: @user.order_total,
                                              ongoing_total: @user.ongoing_total,
                                              due_date: @user.due_date,
                                              domain_name: @user.domain_name,
                                              ip_adr: @user.ip_adr } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email,
                                              tel: @user.tel,
                                              adr: @user.adr,
                                              cty: @user.cty,
                                              ste: @user.ste,
                                              zip: @user.zip,
                                              web_type: @user.web_type,
                                              hosting_type: @user.hosting_type,
                                              security_type: @user.security_type,
                                              date_started: @user.date_started,
                                              date_completed: @user.date_completed,
                                              order_total: @user.order_total,
                                              ongoing_total: @user.ongoing_total,
                                              due_date: @user.due_date,
                                              domain_name: @user.domain_name,
                                              ip_adr: @user.ip_adr } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password:              "password",
                                            password_confirmation: "password",
                                            admin: FILL_IN } }
    assert_not @other_user.FILL_IN.admin?
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

end
