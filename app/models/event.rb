class Event < ActiveRecord::Base
  validates :photo, presence: true
  has_attached_file :photo, styles: { :medium => "640x" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
