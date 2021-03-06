class Ship < ActiveRecord::Base
	belongs_to :game
  belongs_to :user

	validates :classification, presence: true
	validates :size, presence: true, :numericality => { greater_than: 1, less_than_or_equal_to: 5}
	validates :x_coord, presence: true, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 8}
	validates :y_coord, presence: true, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 8}

  def dead
    self.hit_count >= self.size
  end

end
