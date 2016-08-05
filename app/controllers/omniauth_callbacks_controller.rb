class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @vendor = Vendor.from_omniauth(request.env["omniauth.auth"])
    if @vendor.persisted?
      sign_in_and_redirect @vendor, :event => :authentication
      set_flash_message(:notice, :success, :kind => "facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to_new_vendor_registration_url
    end
  end
end
