require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "email_friend" do
    article = articles(:test_article_one)
    mail = Notifier.email_friend(article,"whoever","james@happysquare.com.au")
    assert_equal "Interesting article", mail.subject
    assert_equal ["james@happysquare.com.au"], mail.to
    assert_equal ["from@example.com"], mail.from
   
  end

end
