class Post < ActiveRecord::Base
   self.per_page = 10
   
  def self.search(search)
    where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%") 
  end

end