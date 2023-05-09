class MeetUpEventService
  def initialize
    super
  end

  def fetch_events
    #   fetch all meetups
    response = Faraday.get('https://api.meetup.com/nairuby/events/')
    JSON.parse(response.body)
  end

  def fetch_event(event_id)
    response = Faraday.get("https://api.meetup.com/nairuby/events/#{event_id}")
    JSON.parse(response.body) if response.status == 200
  end
end