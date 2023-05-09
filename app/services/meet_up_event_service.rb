class MeetUpEventService
  def initialize
    super
  end

  def fetch_events
    #   fetch all meetups
    response = Faraday.get('https://api.meetup.com/nairuby/events/')
    JSON.parse(response.body)
  end
end