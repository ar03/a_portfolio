class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUser
  include DefaultPageContent
end
