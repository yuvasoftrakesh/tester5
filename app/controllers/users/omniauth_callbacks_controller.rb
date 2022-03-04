# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # app/controllers/users/omniauth_callbacks_controller.rb:
   def google_oauth2
    handle_auth 'Google'
   end
   
   def facebook
    handle_auth 'facebook'
   end

   def github
    handle_auth 'Github'
   end


  def handle_auth(kind)
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'kind'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.auth_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        sign_in_and_redirect @user, alert: @user.errors.full_messages.join("\n")
      end
  end
end
