class Post < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, :presence => true
 	validates :link, :presence => true
 	validates :description, :presence => true

 	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end