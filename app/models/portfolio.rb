class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :thumb_image, :main_image

  def self.angular                                              #defines scope for all Angular subtitles
    where(subtitle: 'Angular')
  end

  def self.ruby_on_rails                                             #defines scope for all Angular subtitles
    where(subtitle: 'Ruby on Rails')
  end

  after_initialize :set_defaults

  def set_defaults                                              # ||= operator explained by the example below
    self.main_image ||= "https://placehold.it/600x400"          # if self.main_image == nil
    self.thumb_image ||= "https://placehold.it/350manx20"       #   self.main_image = "https://placehold.it/600x400"
  end                                                           # end
end                                                             #
                                                                # self.main image = "https://..." is incorrect and will cause
                                                                # the placehold.it image to override any photo uploaded


