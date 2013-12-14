module Spree
  class Page < ActiveRecord::Base
    include Markdown

    validates :title, :presence => true
    validates :permalink, :uniqueness => true
  
    scope :published, where(:published => true)

    paginates_per 50

    render_as_markdown :body
  end
end
