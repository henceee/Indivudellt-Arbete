class Adventure < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :activity_dates
  has_many :reviews
  
  accepts_nested_attributes_for :activity_dates
   
  
  geocoded_by :adress
  after_validation :geocode, if: :adress_changed?
 
  validates :activity_name,     :presence => true
  validates :description,       :presence => true, length: { maximum: 1500}
  validates :leader,            :presence => true, length: { maximum: 50}
  validates :company_name,      :presence => true, length: { maximum: 50}
  validates :adress,            :presence => true, length: { maximum: 50}
  validates :max_perticipants,  :presence => true, numericality: { only_integer: true,:greater_than => 0}
  validates :price,             :presence => true, numericality: { only_integer: true,:greater_than => 0}
  validates :currency,          :presence => true
  
  
   def average_rating
    reviews.count == 0? 0: reviews.average(:star).round(2)
  end

  
end
