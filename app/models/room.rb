class Room < ApplicationRecord
    has_many :booking
    has_many :user, through :booking
    
    validates_presence_of :room_number
    validates_presence_of :room_type
    validates_inclusion_of :room_number, :in => 100..500
    validates_inclusion_of :room_type, in ['Single', 'Double', 'Suite']
    
    scope :booked, ->{where(booked:true)}
    
end
