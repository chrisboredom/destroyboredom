class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 2 }
	validates :body, presence: true, length: { minimum: 5 }
	has_attached_file :photo, styles: { medium: "600x450>" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
