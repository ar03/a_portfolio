class Portfolio < ApplicationRecord

  has_many :technologies, dependent: :delete_all
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  include ActiveRecord::Acts::List
  acts_as_list

  include Placeholder
  validates_presence_of :title, :body, :thumb_image, :main_image

  def self.angular                                              #defines scope for all 'Angular' subtitles
    where(subtitle: 'Angular')
  end

  def self.ruby_on_rails                                             #defines scope for all 'Ruby on Rails' subtitles
    where(subtitle: 'Ruby on Rails')
  end
  
  def self.by_position
    order("position ASC")
  end

  after_initialize :set_defaults

  def set_defaults                                                                    # ||= operator explained by the example below
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')      # if self.main_image == nil
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')     #   self.main_image = "https://placehold.it/600x400"
  end                                                                                 # end
end                                                                                   #
                                                                                      # self.main image = "https://..." is incorrect and will cause
                                                                                      # the placehold.it image to override any photo uploaded


