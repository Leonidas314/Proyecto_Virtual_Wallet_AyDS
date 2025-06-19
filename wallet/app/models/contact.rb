class Contact < ActiveRecord::Base
  validates :cvu, presence: true, uniqueness: true
  validates :name, presence: true
  belongs_to :user
end