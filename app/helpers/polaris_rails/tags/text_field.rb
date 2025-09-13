module PolarisRails
  module Tags
    class TextField < Base
      def initialize(form:, attribute:, options:)
        @form = form
        @attribute = attribute
        @options = options
        @value = options[:value] || form.object.public_send(attribute)
        @label = options[:label] || attribute.to_s.humanize # TODO: I18n
        options[:minLength] ||= options.delete(:min_length)
        options[:maxLength] ||= options.delete(:max_length)
        options[:readOnly] ||= options.delete(:read_only)
      end

      def render
        tag.s_text_field(
          label: @label,
          value: @value,
          **@options
        ).html_safe
      end
    end
  end
end
