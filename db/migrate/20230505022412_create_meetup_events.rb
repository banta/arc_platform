class CreateMeetupEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :meetup_events do |t|
      t.string :title
      t.text :description
      t.string :rsvp_link
      t.string :image
      t.datetime :start_time
      t.datetime :end_time
      t.string :venue_name
      t.string :venue_address
      t.references :chapter
      t.jsonb :venue_coordinates, default: {}, null: false
      t.jsonb :data, default: {}, null: false

      t.timestamps
    end
  end
end
