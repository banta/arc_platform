class Chapter < ApplicationRecord
  # Attachments
  has_one_attached :image
  has_one_attached :hero_image

  # Associations
  belongs_to :country
  has_many :projects, dependent: :destroy
  has_many :users_chapters
  has_many :users, through: :users_chapters

  # Callbacks
  after_create_commit -> {
    broadcast_prepend_to 'chapters', partial: 'chapters/chapter',
                         locals: { chapter: self }, target: 'chapters' }
  after_update_commit -> { broadcast_update_to 'chapters', partial: 'chapters/chapter',
                                               locals: { country: self }, target: self }
  after_destroy_commit -> { broadcast_remove_to 'chapters', target: self }

  before_validation :update_slug, on: [:create, :update]

  # Validations
  validates :name, :location, :country_id, :description, presence: true
  validates :name, uniqueness: true

  ##
  # Image validation not working because of 'no implicit conversion of StringIO into String' error
  # validates :image, attached: true, content_type: %i[jpg png jpeg],
  #           dimension: {
  #             width: 400, height: 225,
  #             message: 'is not given between dimension. It should be 400x225',
  #           }

  def encoded_address
    Addressable::URI.encode(self.location)
  end

  private

  ##
  # Update slug if the chapter name has changed
  def update_slug
    if name_changed?
      self.slug = name.parameterize(separator: '-')
    end
  end
end
