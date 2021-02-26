require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         biz: "",
                                         tel: "",
                                         adr: "",
                                         cty: "",
                                         ste: "",
                                         zip: "",
                                         web_type: "",
                                         hosting_type: "",
                                         security_type: "",
                                         date_started: "",
                                         date_completed: "",
                                         order_total: "",
                                         ongoing_total: "",
                                         due_date: "",
                                         domain_name: "",
                                         ip_adr: "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         biz: "My Company Name",
                                         tel: "(111) 111-1101",
                                         adr: "404 Hacker BLVD",
                                         cty: "Dallas",
                                         ste: "Texas",
                                         zip: "75189",
                                         web_type: "Web App",
                                         hosting_type: "Corporate",
                                         security_type: "Corporate",
                                         date_started: "01/01/2021",
                                         date_completed: "01/15/2021",
                                         order_total: "$25,000",
                                         ongoing_total: "$1,049.99/Mo | $11,524.89/Yr",
                                         due_date: "January Yearly",
                                         domain_name: "mycompany.com",
                                         ip_adr: "123.321.231.213",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
