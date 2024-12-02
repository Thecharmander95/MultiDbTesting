require "application_system_test_case"

class UploadersTest < ApplicationSystemTestCase
  setup do
    @uploader = uploaders(:one)
  end

  test "visiting the index" do
    visit uploaders_url
    assert_selector "h1", text: "Uploaders"
  end

  test "should create uploader" do
    visit uploaders_url
    click_on "New uploader"

    fill_in "Title", with: @uploader.title
    click_on "Create Uploader"

    assert_text "Uploader was successfully created"
    click_on "Back"
  end

  test "should update Uploader" do
    visit uploader_url(@uploader)
    click_on "Edit this uploader", match: :first

    fill_in "Title", with: @uploader.title
    click_on "Update Uploader"

    assert_text "Uploader was successfully updated"
    click_on "Back"
  end

  test "should destroy Uploader" do
    visit uploader_url(@uploader)
    click_on "Destroy this uploader", match: :first

    assert_text "Uploader was successfully destroyed"
  end
end
