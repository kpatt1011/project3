Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '136999566485816', 'ea7bcffd7a8b3844202b227bcf97bef9',
           :scope => 'email,user_location,user_photos'
end
