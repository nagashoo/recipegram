class Recipe < ApplicationRecord
  has_many :reviews, dependent: :destroy
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

  belongs_to :user
  attachment :image

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
  
end
