module ApplicationHelper
  def provide_title page_title
    base_title = "Sharing Experiences"
    "#{page_title} | #{base_title}" if page_title.present?
  end

  def provide_content content
    content if content.present?

  end
end
