class Product < ActiveRecord::Base

  belongs_to :vendor
  has_many :orders
  has_many :reviews

  has_attached_file :image, styles: {medium: "300x300>", small: "230x140>", thumb: "100x100>"}

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, presence: true, length: {minimum:8}
  validates :description, presence: true, length: {minimum:30}
  validates :price, presence: true
  validates :delivery_time, presence: false
  validates :revisions, presence: false
  validates :requirements, presence: true
  
  def average_rating
		reviews.count == 0 ? 0 : reviews.average(:star).round(2)
	end

	def self.search(query)
		where("title LIKE ? OR description LIKE ? OR requirements LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
	end
end
