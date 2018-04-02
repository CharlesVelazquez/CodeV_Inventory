class Container < ApplicationRecord
	has_and_belongs_to_many :subsections
	has_many :items

	validate  :picture_size

private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 20.megabytes
        errors.add(:picture, "I like HD, 4K stuff too but sheesh, photo's should be less than 20MB")
      end
    end

end