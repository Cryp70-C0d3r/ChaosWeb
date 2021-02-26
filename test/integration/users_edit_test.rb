require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:hacker)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              tel: "",
                                              adr: "",
                                              cty: "",
                                              ste: "",
                                              zip: "",
                                              biz: "",
                                              web_type: "",
                                              security_type: "",
                                              hosting_type: "",
                                              date_started: "",
                                              date_completed: "",
                                              order_total: "",
                                              ongoing_total: "",
                                              due_date: "",
                                              domain_name: "",
                                              ip_adr: "",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end


  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name           = "John Doe"
    email          = "jdoe@aol.com"
    tel            = "254-555-0505"
    adr            = "404 Hacker BLVD"
    cty            = "Dallas"
    ste            = "Texas"
    zip            = "75189"
    web_type       = "Web App"
    hosting_type   = "Corporate"
    security_type  = "Corporate"
    date_started   = "01/01/2021"
    date_completed = "01/15/2021"
    order_total    = "$12,350"
    ongoing_total  = "$312/Mo | $3,419.89/Yr"
    due_date       = "Jan Yearly"
    domain_name    = "jdoe.com"
    ip_adr         = "1.1.1.1"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              tel: tel,
                                              adr: adr,
                                              cty: cty,
                                              ste: ste,
                                              zip: zip,
                                              web_type: web_type,
                                              hosting_type: hosting_type,
                                              security_type: security_type,
                                              date_started: date_started,
                                              date_completed: date_completed,
                                              order_total: order_total,
                                              ongoing_total: ongoing_total,
                                              due_date: due_date,
                                              domain_name: domain_name,
                                              ip_adr: ip_adr,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
    assert_equal tel, @user.tel
    assert_equal adr, @user.adr
    assert_equal cty, @user.cty
    assert_equal ste, @user.ste
    assert_equal zip, @user.zip
    assert_equal web_type, @user.web_type
    assert_equal hosting_type, @user.hosting_type
    assert_equal security_type, @user.security_type
    assert_equal date_started, @user.date_started
    assert_equal date_completed, @user.date_completed
    assert_equal order_total, @user.order_total
    assert_equal ongoing_total, @user.ongoing_total
    assert_equal due_date, @user.due_date
    assert_equal domain_name, @user.domain_name
    assert_equal ip_adr, @user.ip_adr
  end

end
