class Post < ActiveRecord::Base
  scope :draft, ->{ where(published_at: nil) }
  scope :published, ->{ where.not(published_at: nil).where("published_at <= ?", Time.zone.now) }
  scope :scheduled, ->{ where(published_at: nil).where("published_at > ?", Time.zone.now) }

  attr_accessor :status

  extend FriendlyId
  searchkick
  before_validation :clean_up_status
  friendly_id :title, use: :slugged
	validates :title, presence: true, length: { minimum: 2 }
	validates :body, presence: true, length: { minimum: 5 }
	has_attached_file :photo, styles: { medium: "600x450>" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  belongs_to :user

  def clean_up_status
    self.published_at = case status
                        when "Draft"
                          nil
                        when "Published"
                          Time.zone.now
                        else
                          published_at
                        end
    true
  end
end
