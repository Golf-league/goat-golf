class Score < ApplicationRecord
  belongs_to :user

  scope :this_year, -> { where("created_at >?", Date.today.beginning_of_year) }
  scope :last_year, -> { where(created_at: (Date.today.beginning_of_year - 1.year)..Date.today.beginning_of_year) }
  scope :ordered, -> { order(:date, stableford: :desc) }
end
