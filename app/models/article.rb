class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, presence: true,
                    length: { minimum: 5 }
  


   searchable do
    text :title, :boost => 5
    text :text
    text :comments do 
     comments.map {|comment| comment.body}
   end
   text :tags do
     tags.map{|tag| tag.name}
   end
  end
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
  	tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  new_or_found_tags = tag_names.collect { |name| Tag.find_by_name(name)|| Tag.create(name: name) }
  self.tags = new_or_found_tags


end
                  
  
end
