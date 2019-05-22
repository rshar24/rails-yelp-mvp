class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  def avg_rating
    total = self.reviews.count
    total_sum = 0.0
    if self.reviews.exists?
      self.reviews.each do |review|
        total_sum += review.rating
      end
      raw_rating = total_sum / total
      (raw_rating * 2).round.to_f / 2
    else
      0
    end
  end

  def reviews_count
    if self.reviews.count.nil?
      return 0
    else
      return self.reviews.count
    end
  end
end
