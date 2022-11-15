require "application_system_test_case"

class ClassnotesTest < ApplicationSystemTestCase
  setup do
    @classnote = classnotes(:one)
  end

  test "visiting the index" do
    visit classnotes_url
    assert_selector "h1", text: "Classnotes"
  end

  test "should create classnote" do
    visit classnotes_url
    click_on "New classnote"

    fill_in "Title", with: @classnote.title
    click_on "Create Classnote"

    assert_text "Classnote was successfully created"
    click_on "Back"
  end

  test "should update Classnote" do
    visit classnote_url(@classnote)
    click_on "Edit this classnote", match: :first

    fill_in "Title", with: @classnote.title
    click_on "Update Classnote"

    assert_text "Classnote was successfully updated"
    click_on "Back"
  end

  test "should destroy Classnote" do
    visit classnote_url(@classnote)
    click_on "Destroy this classnote", match: :first

    assert_text "Classnote was successfully destroyed"
  end
end
