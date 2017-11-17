class Topic < ApplicationRecord
  self.primary_key = 'name'

  serialize :urls, Array
end
