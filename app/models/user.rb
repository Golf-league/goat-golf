class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :scores

  def total_score
    scores.sum(:stableford)
  end

  def total_rounds
    scores.count
  end

  has_attached_file :avatar, styles: {
    medium: "300x300>",
    thumb: "100x100#"
  }, default_url: "https://s3-us-west-2.amazonaws.com/goats-golf/users/avatars/000/000/001/thumb/goat.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
