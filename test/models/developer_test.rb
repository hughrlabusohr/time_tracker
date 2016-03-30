require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test "developer email unique" do
    d = Developer.new (name: "Hugh Labusohr", email: "hughlabusohr@mac.com", password: BCrypt::Password.create("password"))
    assert "hughlabusohr@mac.com", developers(:one).email
    refute d.save
  end
end
