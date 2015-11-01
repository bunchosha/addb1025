class Job < ActiveRecord::Base
	has_many :post_creators
	has_many :posts, through: :post_creators
end
