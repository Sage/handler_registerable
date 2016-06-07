module HandlerRegisterable
  # Exceptions
  module Exceptions
    # Exception when no handler meets the conditions
    class NoHandlerAccepted < StandardError
      # Meaningful message when for this exception
      def message
        "No Handler Accepted"
      end
    end
  end
end
