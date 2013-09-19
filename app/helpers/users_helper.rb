module UsersHelper
  def gravatar_for (user)

    gravatar_id = user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url)

  end
end
