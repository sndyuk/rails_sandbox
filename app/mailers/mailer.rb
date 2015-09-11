class Mailer < ApplicationMailer
  default from: "..."

  def notify_comment(comment)
    @blog = comment.entry.blog
    @entry = comment.entry
    @comment = comment
    mail(to: "...", subject: "新しいコメントが投稿されました")
  end
end
