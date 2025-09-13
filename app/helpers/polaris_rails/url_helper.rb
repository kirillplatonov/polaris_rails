module PolarisRails
  module UrlHelper
    def s_link_to(name = nil, options = nil, html_options = nil, &block)
      html_options, options, name = options, name, block if block
      options ||= {}
      html_options = convert_options_to_data_attributes(options, html_options)
      url = url_target(name, options)

      content_tag "s-link", href: url, **html_options do
        block&.call || name
      end
    end
  end
end
