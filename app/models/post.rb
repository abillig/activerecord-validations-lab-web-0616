class Post < ActiveRecord::Base

validates :title, presence: true
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
  validates :category, inclusion: %w(Fiction Non-Fiction)
  validate :clickbait 


  def clickbait
    statements = ["Won't Believe", "Secret", "Guess"]
    result = true 
    statements.each do |statement|
      if self.title != nil && self.title.include?(statement)
        result = false 
      end 
    end
    if result == true
      self.errors.add(:title, "clickbait")
    end
  end



end
