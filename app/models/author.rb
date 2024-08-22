class Author < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :age, presence: true, numericality: true

end
