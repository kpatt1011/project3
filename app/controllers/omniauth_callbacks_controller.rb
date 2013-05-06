class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    omniauth = request.env['omniauth.auth']
    @user = User.includes(:authentications).merge(Authentication.where(:provider => omniauth['provider'], :uid => omniauth['uid'])).first
 
    if @user # if user exists and has used this authentication before, update details and sign in
      @user.set_token_from_hash(provider_auth_hash(kind, omniauth), provider_user_hash(kind, omniauth))
      sign_in_and_redirect @user, :event => :authentication
    elsif current_user # if user exists then new authentication is being added - so update details and redirect to 
      current_user.set_token_from_hash(provider_auth_hash(kind, omniauth), provider_user_hash(kind, omniauth))
      redirect_to edit_user_registration_url
    else # create new user and new authentication
      user = User.new
      user.password = Devise.friendly_token[0,20]
      user.authentications.build(provider_auth_hash("Facebook", omniauth))     
      if user.save :validate => false # validate false handles cases where email not provided - such as Twitter
        sign_in_and_redirect(:user, user)
      else # validate false above makes it almost impossible to get here
        session["devise.facebook_data"] = provider_auth_hash("Facebook",omniauth).merge(provider_user_hash("Facebook",omniauth))
        redirect_to new_user_registration_url
      end
    end
  end
  
  def provider_auth_hash(provider, hash)
  # Create provider specific hash's to populate authentication record 
    :provider => hash['provider'],
    :uid => hash['uid'],
    :name => hash['extra']['user_hash']['name'],
    :link => hash['extra']['user_hash']['link'],
    :token => hash['credentials']['token'],
    :secret => nil
  end
 
  def provider_user_hash(provider, hash)
  # Create provider specific hash's to populate user record if appropriate
    :name => hash['extra']['user_hash']['name'],
    :email => hash['extra']['user_hash']['email']
  end
end