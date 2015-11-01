class Post < ActiveRecord::Base
  has_attached_file :pic, styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
  before_save :get_youtube_thumbnail
  default_scope -> { order('created_at DESC') }
  has_many :post_creators
  has_many :creators, through: :post_creators

  def get_youtube_thumbnail
  	
   end

end
