class Question < ApplicationRecord
  def self.todays_question
    where(posted_at: Date.today)
  end

  def self.unasked
    where(posted_at: nil)
  end

  def posted?
    posted_at.present?
  end

  def mark_asked!
    update_attribute(:posted_at, Date.today)
  end
end
