class Song < ActiveRecord::Base

  validates :title, :artist_name, presence: true
  validates :released, inclusion: { in: [true, false], message: "must be true or false" }
  with_options if: :released do |year|
    year.validates :release_year, presence: true
    year.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, message: "must not be in the future!" }
    year.validates :title, uniqueness: { scope: :release_year, message: "can't be re-used in the same year!" }
  end

end
