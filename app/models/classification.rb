class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    Classification.all
  end

  def self.longest
    #boat = Classification.joins(boat_classifications: :boat).order('length desc').limit(2)
    boat = Boat.order('length desc').limit(1)
    Classification.joins(boat_classifications: :boat).where(id: boat)
  end
end
