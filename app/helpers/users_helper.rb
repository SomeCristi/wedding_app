module UsersHelper
  def avatar_for(user, size: 80)
    if user.avatar?
      image_tag user.avatar.url, width: size, height: size, class: 'avatar-image rounded-circle'
    else
      image_tag "default-avatar.png", width: size, height: size, class: 'avatar-image rounded-circle'
    end
  end
end
