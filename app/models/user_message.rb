class UserMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  # attr_accessible :title, :body
end