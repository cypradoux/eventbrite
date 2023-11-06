class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances

    validates :started_date, presence: true
    validates :time, presence: true, numericality: { greater_than: 0 }
    validates :devisible_by_5, presence: true
    validates :title, presence: true, length: { minimum: 5, maximum: 140 }
    validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
    validates :location, presence: true
    validates :started_date_cannot_be_in_the_past, presence: true

    def started_date_cannot_be_in_the_past
        if started_date.present? && started_date < Date.today
            errors.add(:start_date, "cant' be in the past")
        end
    end

    def devisible_by_5
        if time.present? && time % 5!=0
            errors.add(:time, "must be a multiple of 5")
        end
    end
end
