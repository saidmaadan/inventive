class Product < ActiveRecord::Base
  validates :title, presence: true, length: {minimum:8}
  validates :description, presence: true, length: {minimum:30}
  validates :price, presence: true
  validates :delivery_time, presence: false
  validates :revisions, presence: false
  validates :requirements, presence: true
end
