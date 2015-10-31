class Post < ActiveRecord::Base
  has_attached_file :pic, styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
  before_save :get_youtube_thumbnail
  default_scope -> { order('created_at DESC') }

  def get_youtube_thumbnail
  	if self.category_id == 1 
		self.youtube_id = self.youtube.split("v=")[-1]
		self.pic = "http://img.youtube.com/vi/"+ self.youtube_id+ "/0.jpg"
	end
   end

end
