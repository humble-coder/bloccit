class FavoriteMailer < ActionMailer::Base
  default from: "mark.philosophe@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@markbrown-bloccit.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@markbrown-bloccit.com>"
    headers["References"] = "<post/#{@post.id}@markbrown-bloccit.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
