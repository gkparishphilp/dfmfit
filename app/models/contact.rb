class Contact < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message
end
