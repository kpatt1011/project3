Rails.application.config.middleware.use Omniauth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_location,user_photos'
end
