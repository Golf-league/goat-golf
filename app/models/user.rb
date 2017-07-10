class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, invite_key: { email: Devise.email_regexp, nickname: /[a-zA-Z0-9]+/ }
  has_many :scores

  def total_score
    scores.order(stableford: :desc).limit(3).pluck(:stableford).inject(:+)
  end

  def total_rounds
    scores.count
  end

  has_attached_file :avatar, styles: {
    medium: "300x300>",
    thumb: "100x100#"
  }, default_url: "https://s3-us-west-2.amazonaws.com/goats-golf/goat.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
