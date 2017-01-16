class Sprint < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :tasks, :dependent => :destroy
end
