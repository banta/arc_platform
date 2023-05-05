require "test_helper"

class MeetupEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meetup_event = meetup_events(:one)
  end

  test "should get index" do
    get meetup_events_url
    assert_response :success
  end

  test "should get new" do
    get new_meetup_event_url
    assert_response :success
  end

  test "should create meetup_event" do
    assert_difference("MeetupEvent.count") do
      post meetup_events_url, params: { meetup_event: { data: @meetup_event.data, description: @meetup_event.description, end_time: @meetup_event.end_time, image: @meetup_event.image, rsvp_link: @meetup_event.rsvp_link, start_time: @meetup_event.start_time, title: @meetup_event.title, venue_address: @meetup_event.venue_address, venue_coordinates: @meetup_event.venue_coordinates, venue_name: @meetup_event.venue_name } }
    end

    assert_redirected_to meetup_event_url(MeetupEvent.last)
  end

  test "should show meetup_event" do
    get meetup_event_url(@meetup_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_meetup_event_url(@meetup_event)
    assert_response :success
  end

  test "should update meetup_event" do
    patch meetup_event_url(@meetup_event), params: { meetup_event: { data: @meetup_event.data, description: @meetup_event.description, end_time: @meetup_event.end_time, image: @meetup_event.image, rsvp_link: @meetup_event.rsvp_link, start_time: @meetup_event.start_time, title: @meetup_event.title, venue_address: @meetup_event.venue_address, venue_coordinates: @meetup_event.venue_coordinates, venue_name: @meetup_event.venue_name } }
    assert_redirected_to meetup_event_url(@meetup_event)
  end

  test "should destroy meetup_event" do
    assert_difference("MeetupEvent.count", -1) do
      delete meetup_event_url(@meetup_event)
    end

    assert_redirected_to meetup_events_url
  end
end
