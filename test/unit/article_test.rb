require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  #Create
  
  test "should create article" do
    article = Article.new
    article.user = users(:james)
    article.title = "test article"
    article.body = "test body"
    
    assert article.save
  end
  
  test "should find article" do
    article_id = articles(:test_article_one).id
    assert_nothing_raised{Article.find(article_id)}
  end
  
  test "should update article" do
    article = articles(:test_article_two)
    assert article.update_attributes(:title => 'test article 2')
  end
  
  test "should destroy article" do
    article = articles(:test_article_one)
    article.destroy
    assert_raise(ActiveRecord::RecordNotFound) {Article.find(article.id)}
  end
  
  test "should not create an article without title nor body" do
    article = Article.new
    assert !article.valid?
    assert article.errors[:title].any?
    assert article.errors[:body].any?
    assert_equal ["can't be blank"],article.errors[:title]
    assert_equal ["can't be blank"],article.errors[:body]
    assert !article.save
  end
end
