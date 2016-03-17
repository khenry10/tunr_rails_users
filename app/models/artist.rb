class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  validates :name, uniqueness: :true, presence: :true
  belongs_to :user
end
