class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: %i[release_year artist_name],
      message: 'cannot be repeated by the same artist in the same year'
    }

    # 2.11 uniqueness  - https://guides.rubyonrails.org/active_record_validations.html#grouping-conditional-validations


  validates :released, inclusion: { in: [true, false] }

  validates :artist_name, presence: true

#  this is validation for release_years
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year            #i.e. not in the future
    }
  end
  # 5.3 Grouping Conditional validations
  #   Sometimes it is useful to have multiple validations use one condition.
  #   It can be easily achieved using ********* with_options *********



# Custom method
  def released?
    released
  end

end
