require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "ayaz nawaz", email: "ayazing@example.com")
  end

  test "chef must be present" do
    assert @chef.valid?
  end
  test "chefname must be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  test "chefname should not be too short" do
    @chef.chefname = "a"*9
    assert_not @chef.valid?
  end
  test "chefname should not be too long" do
    @chef.chefname = "a"*26
    assert_not @chef.valid?
  end
  test "email must be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  test "email should not be too long" do
    @chef.email = "a"*31 + "@example.com"
    assert_not @chef.valid?
  end
  test "email should be unique and should not be case sensitive" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  test "Only valid email address should be accepted" do
    vaild_addresses= %w[ayaz@example.com abcd.efg@swap.com nawaz@abcd.xyz.org]
    vaild_addresses.each do |va|
    @chef.email = va
    assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  test "invalid email addresses shuld not be accepted" do
    invalid_addresses = %w[ayaz@example,com abcd.efgswap.com nawaz_@_abcd.xyz.org]
    invalid_addresses.each do |iv|
      @chef.email = iv
      assert_not @chef.valid?, '#{iv.inspect} should be valid'
    end
  end

end