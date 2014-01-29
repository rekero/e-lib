class Book < ActiveRecord::Base
has_many :assignments
has_many :authors, through: :assignments
end
