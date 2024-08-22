require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create author" do
    author = Author.new( name: "NLA", email: "nla@gmail.com", age: 21 )
    assert author.valid?
  end

  test "create author without name" do
    author = Author.new( name: nil, email: "nla@gmail.com", age: 21 )
    assert author.invalid?, "Create author without name"
  end

  test "create author without email" do
    author = Author.new( name: "NLA", email: nil, age: 21 )
    assert author.invalid?, "Create author without email"
  end

  test "create author without age" do
    author = Author.new( name: "NLA", email: "nla@gmail.com", age: nil )
    assert author.invalid?, "Create author without age"
  end

  test "create authour with invalid attributes" do
    author = Author.new( name: "NLA", email: "nla@gmail.com", age: "invalid_price")
    assert author.invalid?, "Create author invalid age attributes"
  end
end
