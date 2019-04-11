# **`BloodOath`**

class BloodOath

  @@all = []

  attr_accessor :follower, :cult, :initiation_date
  # returns a `String` that is the initiation date of this blood oath in the format _YYYY-MM-DD_.

  def initialize (follower,cult,date)
    @follower = follower
    @cult = cult
    @initiation_date = date.strftime("%F")
    @@all << self
  end

  def self.first_oath
    #returns the follower instance for the follower that made the very first blood oath
    self.all.min_by {|blood_oath| blood_oath.initiation_date}.follower
  end

  def self.all
    # returns an `Array` of all the blood oaths
    @@all
  end

end
