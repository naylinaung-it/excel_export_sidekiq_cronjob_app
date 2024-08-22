require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @author = authors(:one)
  end

  test "index function success" do
    get authors_url
    assert_response :success
  end

  test "new function success" do
    get new_author_path
    assert_response :success
  end

  test "create function success" do
    assert_difference('Author.count') do
      post authors_path, params: { author: { name: "NLA", email: "nla@gmail.com", age: 21 } } 
    end

    assert_redirected_to author_url(Author.last)
  end

  test "not create function success" do
    assert_no_difference('Author.count') do
      post authors_path, params: { author: { name: nil, email: nil, age: nil } } 
    end
    assert_template :new
  end

  test "show function success" do
    get author_url(@author)
    assert_response :success
    assert_template :show      
  end
  
  test "edit function success" do
    get edit_author_path(@author)
    assert_response :success
    assert_template :edit
  end

  test "update function success" do
    patch author_url(@author), params: { author: { name: @author.name, email: @author.email, age: 27 } }
    assert_redirected_to author_url(@author)
  end

  test "no update function success" do
    patch author_url(@author), params: { author: { name: nil, email: nil, age: nil } }
    assert_template :edit
  end

  test "delete function success" do
    assert_difference('Author.count', -1) do
      delete author_url(@author)
    end
    assert_redirected_to authors_url
  end
end
