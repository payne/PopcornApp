class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
  	cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

private
  def authenticate_user_from_token!
    user_id = params[:auth_user_id].presence
    user = user_id && User.find_by_id(user_id)
    if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      @current_user = user
    else
      permission_denied
    end
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized, :layout => false
  end

  def verified_request?
  	super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

end
