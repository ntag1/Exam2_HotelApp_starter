class User < ApplicationRecord
    has_many :booking
    has_many :room, through :booking
    
    validates_presence_of :first_name, :last_name, :email, :phone
    validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
    validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i
    validates_uniqueness_of :email
    scope :active, ->{where(active:true)}
    scope :inactive, ->{where.not(active:true)}
end
