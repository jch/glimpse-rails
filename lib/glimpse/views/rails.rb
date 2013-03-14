module Glimpse
  module Views
    class Rails < View
      # This view displays the milliseconds spent in the following:
      #
      # * the controller action
      # * processing sql (0 if no sql is run)
      # * rendering views
      #
      # These values are reported by the ActiveSupport::Notification named
      # `process_action.action_controller`.
      #
      # See also
      # http://edgeguides.rubyonrails.org/active_support_instrumentation.html
      def initialize(options = {})
        @event = nil

        # This isn't fired off until the action is complete. But the glimpse
        # bar and results are part of the action
        ActiveSupport::Notifications.subscribe "process_action.action_controller" do |*args|
          @event = ActiveSupport::Notifications::Event.new(*args)
        end
      end

      # Deferred results are injected into the html body after results finish rendering
      def results
        {
          :controller => "#{@event.duration.to_i}ms controller",
          :sql        => "#{@event.payload[:db_runtime].to_i}ms sql", # not documented?
          :views      => "#{@event.payload[:view_runtime].to_i}ms views"
        }
      rescue
        # TODO: log an error here, or display it in the view
        {}
      end
    end
  end
end