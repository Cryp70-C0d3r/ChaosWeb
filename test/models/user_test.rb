require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "John Doe", email: "name@me.com", biz: "My Company", tel: "111-111-1111", adr: "404 Hacker BLVD", cty: "Dallas", ste: "Texas", zip: "75189", web_type: "E-Commerce", hosting_type: "Basic", security_type: "Corporate", seo_type: "Corporate", date_started: "01/01/2021", date_completed: "01/15/2021", order_total: "$750", ongoing_total: "$312/Mo | $3,419.89/Yr", due_date: "1st of Month | Jan Yearly", domain_name: "me.com", ip_adr: "1.1.1.1", password: "abc123", password_confirmation: "abc12")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "Name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "Name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "Email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "Email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "Biz should be present" do
    @user.biz = "    "
    assert_not @user.valid?
  end

  test "Biz should not be too long" do
    @user.biz = "a" * 101
    assert_not @user.valid?
  end

  test "Tel should be present" do
    @user.tel = "    "
    assert_not @user.valid?
  end

  test "Tel should not be too long" do
    @user.tel = "a" * 15
    assert_not @user.valid?
  end

  test "Adr should be present" do
    @user.adr = "    "
    assert_not @user.valid?
  end

  test "Adr should not be too long" do
    @user.adr = "a" * 51
    assert_not @user.valid?
  end

  test "Cty should be present" do
    @user.cty = "    "
    assert_not @user.valid?
  end

  test "Cty should not be too long" do
    @user.cty = "a" * 51
    assert_not @user.valid?
  end

  test "Ste should be present" do
    @user.ste = "    "
    assert_not @user.valid?
  end

  test "Ste should not be too long" do
    @user.ste = "a" * 51
    assert_not @user.valid?
  end

  test "Zip should be present" do
    @user.zip = "    "
    assert_not @user.valid?
  end

  test "Zip should not be too long" do
    @user.zip = "a" * 7
    assert_not @user.valid?
  end

  test "Web Type should be present" do
    @user.web_type = "    "
    assert_not @user.valid?
  end

  test "Web Type should not be too long" do
    @user.web_type = "a" * 15
    assert_not @user.valid?
  end

  test "Hosting Type should be present" do
    @user.hosting_type = "    "
    assert_not @user.valid?
  end

  test "Hosting Type should not be too long" do
    @user.hosting_type = "a" * 13
    assert_not @user.valid?
  end

  test "Security Type should be present" do
    @user.security_type = "    "
    assert_not @user.valid?
  end

  test "Security Type should not be too long" do
    @user.security_type = "a" * 13
    assert_not @user.valid?
  end

  test "SEO Type should be present" do
    @user.seo_type = "    "
    assert_not @user.valid?
  end

  test "SEO Type should not be too long" do
    @user.seo_type = "a" * 13
    assert_not @user.valid?
  end

  test "Date Started should be present" do
    @user.date_started = "    "
    assert_not @user.valid?
  end

  test "Date Started should not be too long" do
    @user.date_started = "a" * 15
    assert_not @user.valid?
  end

  test "Date Completed should not be too long" do
    @user.date_completed = "    "
    assert_not @user.valid?
  end

  test "Date Completed should not be too long" do
    @user.date_completed = "a" * 15
    assert_not @user.valid?
  end

  test "Order Total should be present" do
    @user.order_total = "    "
    assert_not @user.valid?
  end

  test "Order Total should not be too long" do
    @user.order_total = "a" * 15
    assert_not @user.valid?
  end

  test "Ongoing Total should be present" do
    @user.ongoing_total = "    "
    assert_not @user.valid?
  end

  test "Ongoing Total should not be too long" do
    @user.ongoing_total = "a" * 41
    assert_not @user.valid?
  end

  test "Due Date should be present" do
    @user.due_date = "    "
    assert_not @user.valid?
  end

  test "Due Date should not be too long" do
    @user.due_date = "a" * 41
    assert_not @user.valid?
  end

  test "Domain Name should be present" do
    @user.domain_name = "    "
    assert_not @user.valid?
  end

  test "Domain Name should not be too long" do
    @user.domain_name = "a" * 101
    assert_not @user.valid?
  end

  test "IP Address should be present" do
    @user.ip_adr = "    "
    assert_not @user.valid?
  end

  test "IP Address should not be too long" do
    @user.ip_adr = "a" * 21
    assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
