class Book < ActiveRecord::Base
has_many :assignments
has_many :authors, through: :assignments
validates :title, presence: true,
                    length: { maximum: 30 }
end
