class Project < ApplicationRecord
  belongs_to :user
  has_many :sprints, :dependent => :destroy
end
