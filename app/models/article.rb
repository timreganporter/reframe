class Article < ActiveRecord::Base
  # TODO: make composite url + is_primary unique (not url)
  validates :url,  presence: true, length: { maximum: 255  }, uniqueness: { case_sensitive: false }
  validates :headline,  presence: true, length: { maximum: 255  }
end
