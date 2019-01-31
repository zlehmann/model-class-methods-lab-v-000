class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    Classification.all
  end

  def self.longest
    boat = Boat.joins(boat_classifications: :boat).order('length desc')
    Classification.where(boat_id: boat)
  end
end
