class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  
  def index
  	puts 'YOU ARE AT HOME'
  end
end
