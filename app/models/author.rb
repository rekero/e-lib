class Author < ActiveRecord::Base
has_many :assignments
has_many :books, through: :assignments
validates :name, presence: true, uniqueness: true,
                    length: { maximum: 30 }	
end
