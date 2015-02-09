class Group < ActiveRecord::Base
  has_many :events, dependent: :destroy
  belongs_to :user

  scope :visible, -> { where(visible: true) }
  scope :available, -> { where(visible: true, restricted: false) }

  validates :name, presence: true, uniqueness: true
  validates :acronym, presence: true

  def to_s
    "#{name} (#{acronym})"
  end
end
