class Author < ActiveRecord::Base
has_many :assignments
has_many :books, through: :assignments
end
