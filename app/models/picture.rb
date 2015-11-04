class Picture < ActiveRecord::Base
  belongs_to :post


   has_attached_file :pic , styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
	         	:path => "#{Rails.root}/public/photo_attachment/:id/:style/:basename.:extension",
                :url => "/photo_attachment/:id/:style/:basename.:extension"

  validates_attachment_size :pic, :less_than => 3.megabytes
  validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png','image/gif']

end
