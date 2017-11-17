class Topic < ApplicationRecord
  self.primary_key = 'name'

  serialize :urls, Array

  def urls_string
    urls.join("\n")
  end

  def urls_string=(url_string)
    self.urls = url_string.split("\n").map(&:chomp)
  end
end
