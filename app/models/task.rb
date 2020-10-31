class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true, length: {minimum: 1,maximum: 60}

  def completed?
    if status.nil? or complated_at.blank?
      return false 
    else
      return true
    end
  end
end
