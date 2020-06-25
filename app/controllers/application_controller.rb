class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUser
  include DefaultPageContent
  
  before_action :set_copyright

  def set_copyright
    @copyright = AHdevViewTool::Renderer.copyright 'Alex H', 'All rights reserved'
  end
end

module AHdevViewTool
end
