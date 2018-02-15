class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "should happen once per year" }
  validates :released, inclusion: { in: %w(True False) }

  with_options if: released==true do |song|
   song.validates :release_year, presence: true
   admin.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
 end

  validates :artist_name, presence: true

end
