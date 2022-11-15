require "test_helper"

class ClassnotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classnote = classnotes(:one)
  end

  test "should get index" do
    get classnotes_url
    assert_response :success
  end

  test "should get new" do
    get new_classnote_url
    assert_response :success
  end

  test "should create classnote" do
    assert_difference("Classnote.count") do
      post classnotes_url, params: { classnote: { title: @classnote.title } }
    end

    assert_redirected_to classnote_url(Classnote.last)
  end

  test "should show classnote" do
    get classnote_url(@classnote)
    assert_response :success
  end

  test "should get edit" do
    get edit_classnote_url(@classnote)
    assert_response :success
  end

  test "should update classnote" do
    patch classnote_url(@classnote), params: { classnote: { title: @classnote.title } }
    assert_redirected_to classnote_url(@classnote)
  end

  test "should destroy classnote" do
    assert_difference("Classnote.count", -1) do
      delete classnote_url(@classnote)
    end

    assert_redirected_to classnotes_url
  end
end
