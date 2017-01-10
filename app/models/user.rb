class User < ApplicationRecord
  has_many :projects, :dependent => :destroy
  accepts_nested_attributes_for :projects, :reject_if => lambda { |a| a[:content].blank}, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end
end
