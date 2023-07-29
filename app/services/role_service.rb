class RoleService
  def initialize(post, url)
      @post = post
      @url = url
  end

  def call
      message = "New Post \nTitle: #{@post.title}\nYou can view it here: #{@url}"
      Bot.send_message(COMMANDS_CHANNEL, message)
  end
end
