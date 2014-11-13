class Event < ActiveRecord::Base
  include GeoRuby::SimpleFeatures

  belongs_to :group
  belongs_to :user
  has_many :reports

  scope :visible, -> { where(visible: true).includes(:user, :reports).where(users: { banned: false }).where('ends_at >= ?', Time.zone.now) }
  scope :recent, -> { where('starts_at <= ?', Time.zone.now + 60.days).order(event_at: :asc) }

  validates :title, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true

  # serialize :location

  def location=(geom)
    geometry = Point.from_x_y(geom[:lng],geom[:lat])

    write_attribute(:location, geometry.as_wkt)
  end

  def geometry=(geom)
    @geom = geom
  end

  def geometry
    return @geom unless @geom.nil?

    if read_attribute(:location).present?
      @geom = Geometry.from_ewkt(read_attribute(:location))
    else
      @geom = Point.new
    end

    @geom
  end

  def location
    geometry
  end

  def visible?
    self.visible and not self.user.banned?
  end

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def hidden_reason
    if self.visible
      "Event was hidden"
    elsif self.user.banned?
      "User was banned"
    end
  end

  def has_address?
    self.address_1.present? or self.address_2.present?
  end

  def address
    [self.address_1, self.address_2].delete_if(&:empty?).join(", ")
  end
end
