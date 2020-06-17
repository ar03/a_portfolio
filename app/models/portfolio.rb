class Portfolio < ApplicationRecord

  validates_presences_of :title, :body, :thumb_image, :main_image
end
