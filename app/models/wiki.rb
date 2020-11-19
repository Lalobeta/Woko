class Wiki < ActiveRecord::Base
  # Relationships
  #belongs_to :author, class_name: 'User'
  validates_presence_of :title, :description

  validates :title, :length => {:minimum => 5}
  
  # ActiveStorage
  has_one_attached :thumbnail
  has_many_attached :images

  #kaminari
  paginates_per 5
  

end
