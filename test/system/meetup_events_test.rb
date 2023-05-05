require "application_system_test_case"

class MeetupEventsTest < ApplicationSystemTestCase
  setup do
    @meetup_event = meetup_events(:one)
  end

  test "visiting the index" do
    visit meetup_events_url
    assert_selector "h1", text: "Meetup events"
  end

  test "should create meetup event" do
    visit meetup_events_url
    click_on "New meetup event"

    fill_in "Data", with: @meetup_event.data
    fill_in "Description", with: @meetup_event.description
    fill_in "End time", with: @meetup_event.end_time
    fill_in "Image", with: @meetup_event.image
    fill_in "Rsvp link", with: @meetup_event.rsvp_link
    fill_in "Start time", with: @meetup_event.start_time
    fill_in "Title", with: @meetup_event.title
    fill_in "Venue address", with: @meetup_event.venue_address
    fill_in "Venue coordinates", with: @meetup_event.venue_coordinates
    fill_in "Venue name", with: @meetup_event.venue_name
    click_on "Create Meetup event"

    assert_text "Meetup event was successfully created"
    click_on "Back"
  end

  test "should update Meetup event" do
    visit meetup_event_url(@meetup_event)
    click_on "Edit this meetup event", match: :first

    fill_in "Data", with: @meetup_event.data
    fill_in "Description", with: @meetup_event.description
    fill_in "End time", with: @meetup_event.end_time
    fill_in "Image", with: @meetup_event.image
    fill_in "Rsvp link", with: @meetup_event.rsvp_link
    fill_in "Start time", with: @meetup_event.start_time
    fill_in "Title", with: @meetup_event.title
    fill_in "Venue address", with: @meetup_event.venue_address
    fill_in "Venue coordinates", with: @meetup_event.venue_coordinates
    fill_in "Venue name", with: @meetup_event.venue_name
    click_on "Update Meetup event"

    assert_text "Meetup event was successfully updated"
    click_on "Back"
  end

  test "should destroy Meetup event" do
    visit meetup_event_url(@meetup_event)
    click_on "Destroy this meetup event", match: :first

    assert_text "Meetup event was successfully destroyed"
  end
end
