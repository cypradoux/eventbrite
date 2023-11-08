class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :user

    validates :started_date, presence: true
    validates :duration, presence: true, numericality: { greater_than: 0 }
    validates :title, presence: true, length: { minimum: 5, maximum: 140 }
    validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
    validates :location, presence: true
    validate :started_date_cannot_be_in_the_past
    validate :devisible_by_5

    def started_date_cannot_be_in_the_past
        if started_date.present? && started_date < Date.today
            errors.add(:started_date, "cant' be in the past")
        end
    end

    def devisible_by_5
        if duration.present? && duration % 5!=0
            errors.add(:duration, "must be a multiple of 5")
        end
    end
end
