module MentionHelper
  def mention content
    content.gsub(/(?<!\w)@\w+/) do |u|
      username = u.gsub(/@/, '')
      if User.where(:username => username).blank?
        "@#{username}"
      else
        link_to username, user_profile_path(username)
      end
    end
  end
end
