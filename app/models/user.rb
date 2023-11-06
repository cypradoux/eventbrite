class User < ApplicationRecord
    has_many :events
    has_many :events, through: :attendances

    validates :first_name, presence: true
    validates :description, presence: true

    # after_create :welcome_send
end
