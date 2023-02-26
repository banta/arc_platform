class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :lockable, :timeoutable

  # Associations
  has_many :users_chapters
  has_many :chapters, through: :users_chapters

  # Callbacks
  before_create :set_defaults # Set model defaults before create

  # Enums
  enum role: %i[member chapter_admin organization_admin]

  # Validations
  validates :email, :name, :phone_number, :github_username, presence: true
  validates :github_username, :phone_number, uniqueness: true

  private


  ##
  # A method to set model defaults if they are not set. e.g. if role is not set the default will be
  # :member.
  def set_defaults
    self.role ||= :member
  end
end
