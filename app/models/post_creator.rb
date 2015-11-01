class PostCreator < ActiveRecord::Base
	belongs_to :post
	belongs_to :creator
end
