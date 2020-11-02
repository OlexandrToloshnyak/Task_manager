class Project < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2,maximum: 15}
  has_many :tasks 
end
