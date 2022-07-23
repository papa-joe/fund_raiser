class Restaurant < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, with: /@/
    validates :phone, presence: true
    validates :location_no, presence: true
    validates :from_time, presence: true
    validates :to_time, presence: true
    validates :avg_menu_price, presence: true
    validates :percent_donation, presence: true
    validates :website, presence: true
    validates :logo, presence: true
    validates :password, presence: false
    validates :tax, presence: false
    validates :leader_arrival, presence: false
    validates :alcohol_sales, presence: false
    validates :coupons, presence: false
    has_many :days, dependent: :destroy
    has_many :locations, dependent: :destroy
end
