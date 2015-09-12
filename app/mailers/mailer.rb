class Mailer < ApplicationMailer
  default from: "info@sndyuk.com"

  def notify_comment(comment)
    @blog = comment.entry.blog
    @entry = comment.entry
    @comment = comment
    mail(to: "sanada@sndyuk.jp", subject: "新しいコメントが投稿されました")
  end
end
