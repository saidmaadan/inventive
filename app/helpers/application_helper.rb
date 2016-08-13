module ApplicationHelper
  def get_avatar_url(vendor)
    gravatar_id = Digest::MD5::hexdigest(vendor.email).downcase
    if vendor.image
      vendor.image
    else
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
  end
end
