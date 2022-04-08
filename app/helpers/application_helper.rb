module ApplicationHelper

	def logged_in?
		!!cookies[:user_id]
	end

	def current_user
		@current_user ||= User.find(cookies[:user_id]) if !!cookies[:user_id]
	end
end
