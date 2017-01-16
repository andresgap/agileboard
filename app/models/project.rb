class Project < ApplicationRecord
  belongs_to :user
  has_many :sprints, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
end
