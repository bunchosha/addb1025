class Creator < ActiveRecord::Base
	has_many :posts

	before_save { self.roma = roma.downcase}
	validates :roma , presence: true,
					uniqueness: { case_sensitive: true }

	validates :name , presence: true,
					uniqueness: { case_sensitive: true }

    accepts_nested_attributes_for :posts, allow_destroy: true

end
