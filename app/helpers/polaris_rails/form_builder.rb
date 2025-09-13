module PolarisRails
  class FormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::OutputSafetyHelper

    attr_reader :template

    delegate :render, :pluralize, to: :template

    def error_for(method)
      return if object.blank?
      return unless object.errors.key?(method)

      raw object.errors.full_messages_for(method)&.first
    end

    def s_text_field(method, **options, &block)
      apply_error_options(options, method)

      Tags::TextField.new(form: self, attribute: method, options:).render
    end

    private

    def apply_error_options(options, method)
      return if options.has_key?(:error)

      options[:error] ||= error_for(method)
    end
  end
end
