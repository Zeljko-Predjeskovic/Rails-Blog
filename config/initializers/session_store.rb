Rails.application.config.session_store :user_id, 
  :key => '_my_session', 
  :expire_after => 60.minutes