class Contact < ActiveRecord::Base
  validates :cvu, presence: true, uniqueness: { message: 'ya está en uso' }
  validates :name, presence: { message: "no puede estar vacío" }
  belongs_to :user
end 