module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "ah.dev | Portfolio"
    @seo_keywords = "Alex"
  end
end
