class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    
    def self.getAll
        return Rails.cache.fetch(['users', __method__], expires_in: 30.minutes) do
            users = User.all
        end
    end
end
