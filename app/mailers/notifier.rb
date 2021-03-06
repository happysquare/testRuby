class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(article,sender_name,email)
    @article = article
    @sender_name = sender_name
    attachments["rails.png"] = File.read(Rails.root.join('public/images/rails.png'))
    mail :to => email, :subject => 'Interesting article'
  end
  
  def comment_update(comment)
    
    @comment = comment
    @article = comment.article
    
    attachments["rails.png"] = File.read(Rails.root.join('public/images/rails.png'))
    mail :to => User.find(@article.user_id).email, :subject => 'There has been a comment on your article'
    
  end
end
