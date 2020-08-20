class Airplane < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_model_and_category,
    against: [ :model, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
