class Event < ActiveRecord::Base
  include GeoRuby::SimpleFeatures

  belongs_to :group
  belongs_to :user
  has_many :reports, dependent: :destroy

  scope :visible, proc {
    where(visible: true).where('reports_count < 3').includes(:user).where(users: { banned: false }).where('ends_at >= ?', 1.day.ago)
  }
  scope :recent, -> { where('starts_at <= ?', Time.zone.now + 60.days).order(event_at: :asc) }

  validates :title, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true

  # serialize :location

  def location=(geom)
    geometry = Point.from_x_y(geom[:lng], geom[:lat])

    self[:location] = geometry.as_wkt
  end

  def geometry=(geom)
    @geom = geom
  end

  def geometry
    return @geom unless @geom.nil?

    if self[:location].present?
      @geom = Geometry.from_ewkt(self[:location])
    else
      @geom = Point.new
    end

    @geom
  end

  def location
    geometry
  end

  def visible?
    visible && reports.size < 3 && !user.banned? && ends_at >= 1.day.ago
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def hidden_reason
    if !visible
      'post was hidden'
    elsif reports.size >= 3
      "reported #{reports.size} times"
    elsif ends_at < 1.day.ago
      'post has expired'
    elsif user.banned?
      'user was banned'
    end
  end

  def has_address?
    address_1.present? || address_2.present?
  end

  def address
    [address_1, address_2].delete_if(&:empty?).join(', ')
  end
end
