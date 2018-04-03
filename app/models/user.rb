class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, invite_key: { email: Devise.email_regexp, nickname: /[a-zA-Z0-9]+/ }
  has_many :scores

  def total_score
    this_years_scores.inject(:+)
  end

  def total_rounds
    scores.count
  end

  def total_rounds_this_year
    scores.this_year.count
  end

  def last_years_total_score
    last_years_scores.inject(:+)
  end

  def last_years_scores
    scores.last_year.order(stableford: :desc).limit(3).pluck(:stableford)
  end

  def this_years_scores
    scores.this_year.order(stableford: :desc).limit(3).pluck(:stableford)
  end

  def best_score
    this_years_scores.first
  end

  def second_score
    this_years_scores.second
  end

  def third_score
    this_years_scores.third
  end

  def last_years_best_score
    last_years_scores.first
  end

  def last_years_second_score
    last_years_scores.second
  end

  def last_years_third_score
    last_years_scores.third
  end

  has_attached_file :avatar, styles: {
    medium: "300x300>",
    thumb: "100x100#"
  }, default_url: "https://s3-us-west-2.amazonaws.com/goats-golf/goat.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
