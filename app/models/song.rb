
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same artist in the same year'
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end

end


  # class Song < ActiveRecord::Base
  #   validates :title, presence: true
  #   validates :released, inclusion: { in: [ true, false ] }
  #   validates :artist_name, presence: true
  #   validate :release_year, presence: true if: { self.released == true && :no_repeat && :release_year_valid?}
  #
  #
  #   def no_repeat
  #     t = Time.now
  #     if self.release_year == t.year
  #       errors.add(:title, "Cannot release a song of the same name in the same year")
  #     end
  #   end
  #
  #   def release_year_valid?
  #     t = Time.now
  #     if t.year =< release_year
  #       errors.add(:title, "Release year cannot be in the future")
  #     end
  #   end
  #
  # end
