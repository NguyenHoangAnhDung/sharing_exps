class ApplicationController < ActionController::Base
  include DeviseWhiteList
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = DevcampViewTool::Renderer.copyright "D2 Forever", "All rights reserved"
  end
end

module DevcampViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
