class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :room
    
    validates_presence_of :user_id, :room_id, :start_date, :end_date
    validates_numericality_of :user_id
    validates_numericality_of :room_id
    
    scope :chronological, -> { order('date DESC') }
    scope :upcoming, -> {after Date.current}
    scope :past, -> {before Date.current}
end
