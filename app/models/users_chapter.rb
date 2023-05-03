class UsersChapter < ApplicationRecord
  # Associations
  belongs_to :chapter
  belongs_to :user

  def self.find_by_chapter(chapter_id)
    users_chapter = find_by(chapter_id: chapter_id, leader: true)
    users_chapter&.user&.name || 'No Leader yet'
  end
end
