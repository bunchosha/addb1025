class Picture < ActiveRecord::Base
  belongs_to :post
  has_attached_file :pic, styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

end
