class Task < ApplicationRecord
  belongs_to :project

  def completed?
    if status.nil? or complated_at.blank?
      return false 
    else
      return true
    end
  end
end
