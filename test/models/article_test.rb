require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(url: "http://www.aljazeera.com/news/americas/2014/11/protesters-target-retailers-across-us-2014112963551553414.html",
                           headline: "Ferguson protests target retailers across US",
                           is_primary: true)
  end

  test "should be valid" do
    assert @article.valid?
  end

  test "url should be present" do
    @article.url = "     "
    assert_not @article.valid?
  end

  test "headline should be present" do
    @article.headline = "     "
    assert_not @article.valid?
  end

  test "url should not be too long" do
    @article.url = "a" * 256
    assert_not @article.valid?
  end

  test "headline should not be too long" do
    @article.headline = "a" * 256
    assert_not @article.valid?
  end

  # TDOO: make sure is_primary is present (after generating in code)
  # TODO: make composite url + is_primary unique (not url)
  test "url address should be unique" do
    duplicate_article = @articleldup
    duplicate_article.url = @article.url.upcase
    @article.save
    assert_not duplicate_article.valid?
  end
end