module ApplicationHelper

	def logged_in?
		!!cookies.encrypted[:user_id]
	end

	def current_user
		@current_user ||= User.find(cookies.encrypted[:user_id]) if !!cookies.encrypted[:user_id]
	end
end
