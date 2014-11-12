class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessaoHelper
	helper_method :random

	def random
	@registros = Usuario.count('nomeCompleto', :distinct => true)
	if (@registros < 5)
    	@random_no = @registros
    	@random ||= Usuario.order('RANDOM()').limit(@random_no)
		@random.map do |usuario|
   		usuario
  		end
	 else
		@random ||= Usuario.order('RANDOM()').limit(5)
	 end
	end
end
