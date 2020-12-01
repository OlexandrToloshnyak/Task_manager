class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true, length: {minimum: 2,maximum: 60}
  # validates :priority, presence: true
  # validates :deadline, presence: true
  enum priority: [:low,:normal,:important,:critical]

  def priority?
    return priority
  end

  def completed?
    if status.nil? or complated_at.blank?
      return false 
    else
      return true
    end
  end
end
