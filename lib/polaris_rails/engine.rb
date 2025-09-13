module PolarisRails
  class Engine < ::Rails::Engine
    isolate_namespace PolarisRails

    initializer "polaris_rails.helpers" do
      ActiveSupport.on_load(:action_controller_base) do
        helper PolarisRails::UrlHelper
      end
    end
  end
end
