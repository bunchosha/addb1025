
class Assign < ActiveRecord::Base
	belongs_to :post
	belongs_to :creator
end
