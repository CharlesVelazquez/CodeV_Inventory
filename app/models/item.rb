class Item < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :owner, class_name: "User", foreign_key: "owner_id", optional: true
	belongs_to :storage_location, optional: true
	belongs_to :section, optional: true
	belongs_to :subsection, optional: true
	belongs_to :container, optional: true
	has_and_belongs_to_many :tags
	mount_uploader :picture, PictureUploader
	mount_uploader :reciept_picture, PictureUploader

	validate  :picture_size

private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 20.megabytes
        errors.add(:picture, "I like HD, 4K stuff too but sheesh, photo's should be less than 20MB")
      end
    end


end
