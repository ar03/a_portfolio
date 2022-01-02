class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :delete_all
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }


  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular                                              #defines scope for all 'Angular' subtitles
    where(subtitle: 'Angular')
  end

  def self.ruby_on_rails                                             #defines scope for all 'Ruby on Rails' subtitles
    where(subtitle: 'Ruby on Rails')
  end

  def self.by_position
    order("position ASC")
  end

end                                                                                   #
                                                                                      # self.main image = "https://..." is incorrect and will cause
                                                                                      # the placehold.it image to override any photo uploaded


