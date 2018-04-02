class Item < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :owner, class_name: "User", foreign_key: "user_id", optional: true
	belongs_to :storage_location, optional: true
	belongs_to :section, optional: true
	belongs_to :subsection, optional: true
	belongs_to :container, optional: true
	has_and_belongs_to_many :tags
	mount_uploader :picture, PictureUploader
	mount_uploader :reciept_picture, PictureUploader

end
