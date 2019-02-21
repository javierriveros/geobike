module ApplicationHelper

  def page_header(title, subtitle, route, options = {})
    h1 = content_tag(:h1, title.html_safe, class: 'title')
    h4 = content_tag(:h4, subtitle.html_safe)
    brand = content_tag(:div, h1 + h4, class: 'brand')
    col = content_tag(:div, brand, class: 'col-md-8 ml-auto mr-auto text-center')
    row = content_tag(:div, col, class: 'row')
    container = content_tag(:div, row, class: 'container')
    content_tag(:header, container, class: "page-header header-filter header-small #{options[:class]}", style: "background-image: url(#{route}); #{options[:style]}", "data-parallax": true)
  end
end
