module Glimpse
  module Rails
    # Overrides ActionController::Base#dispatch to inject glimpse/results
    # before the end body tag. This evaluates the results partial within a
    # controller context for #glimpse_enabled? and other helper methods
    # unavailable in regular middleware.
    module ControllerMethods
      extend ActiveSupport::Concern

      def dispatch(name, request) #:nodoc:
        output = super

        # render_to_string is overridden after the body is closed. Call raw
        # render_to_body here. See
        # ActionController::Metal::Rendering#render_to_string
        glimpse_results = render_to_body(:partial => 'glimpse/results')

        # TODO: gsub! doesn't work. Seems really inefficient to regex replace
        # the whole body
        new_body = output.last.body.gsub(/<\/body>/i,  "#{glimpse_results}</body>")
        output.last.body = new_body

        output
      end
    end

    class Railtie < ::Rails::Engine
      initializer 'glimpse-rails.action_dispatch' do
        ActiveSupport.on_load :action_controller do
          include ControllerMethods
        end
      end
    end
  end
end
