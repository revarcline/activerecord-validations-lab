class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :is_clickbait

  def is_clickbait
    errors.add(:title, 'must be clickbait') unless title =~ /(Won't\ Believe|Secret|Top \d|Guess)/i
  end
end
