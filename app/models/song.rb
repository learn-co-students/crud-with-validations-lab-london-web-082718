class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "can't add song as a song with this title has been released by this artist already this year"}
  validates :genre, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, inclusion: { in: 1900..Date.today.year }
end
  # validates :song_title_cannot_be_repeated_by_same_artist_in_the_same_year



# custom validations

  # def song_title_cannot_be_repeated_by_same_artist_in_the_same_year
  #   Song.all.find do |song|
  #   if song.artist_name && song.release_year && song.title == self.artist_name && self.release_year && self.title
  #     errors.add(:expiration_date, "can't add song as a song with this title has been released by this artist already this year")
  #   end
  # end
  # end



  # def release_year_cannot_be_in_future
  #   if self.release_year > Date.today.year
  #     errors.add(:discount, "can't release song in future")
  #   end
  # end

end
