module PolarisRails
  module UrlHelper
    def s_button_to(name = nil, options = nil, html_options = nil, &block)
      html_options, options = options, name if block
      options ||= {}
      html_options ||= {}

      content_tag "s-button", **html_options do
        block&.call || name
      end
    end

    def s_link_to(name = nil, options = nil, html_options = nil, &block)
      html_options, options, name = options, name, block if block
      options ||= {}
      html_options = convert_options_to_data_attributes(options, html_options)
      url = url_target(name, options)

      content_tag "s-link", href: url, **html_options do
        block&.call || name
      end
    end

    def s_mail_to(email_address, name = nil, html_options = {}, &block)
      html_options, name = name, nil if name.is_a?(Hash)
      html_options = (html_options || {}).stringify_keys

      extras = %w[cc bcc body subject reply_to].map! { |item|
        option = html_options.delete(item).presence || next
        "#{item.dasherize}=#{ERB::Util.url_encode(option)}"
      }.compact
      extras = extras.empty? ? "" : "?" + extras.join("&")

      encoded_email_address = ERB::Util.url_encode(email_address).gsub("%40", "@")
      url = "mailto:#{encoded_email_address}#{extras}"

      content_tag "s-link", href: url, **html_options do
        block&.call || email_address || name
      end
    end
  end
end
