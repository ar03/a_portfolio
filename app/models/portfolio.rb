class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :thumb_image, :main_image

  def self.angular                                              #defines scope for all Angular subtitles
    where(subtitle: 'Angular')
  end

  def self.ruby_on_rails                                             #defines scope for all Angular subtitles
    where(subtitle: 'Ruby on Rails')
  end
end
