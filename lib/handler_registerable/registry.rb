# HandlerRegisterable Registry
module HandlerRegisterable
  # Registry Concept
  module Registry
    @@default = nil

    # Enables setting the default handler to use.
    def default=(value)
      @@default = value
    end

    # Get the default handler
    def default
      @@default
    end

    # Register a new item in the store
    def register(item, key)
      registered_handlers[key] = item
    end

    # Return the registered handlers
    def registered_handlers
      @@registered_handlers ||= {}
    end

    # @param [Object] conditions An argument to be passed to the handles? and initialize methods
    # of the handler classes. Used to determine if they can deal with the request or not.
    # @return [Object, nil] An instance of the first handler class that returns true to handles?
    # when given the condition argument. The instance is initialized with the given condition.
    def obtain(*conditions)
      registered_handlers = self.registered_handlers
      # Reverses the order of the handlers, this allows for ones defined in an application rather
      # than an engine to come first (to allow for overriding a handle)
      registered_handlers = Hash[registered_handlers.to_a.reverse] unless no_handlers_defined?
      registered_handlers.each do |identifier, h|
        return h.new(*conditions) if h.handles?(*conditions)
      end

      # If no handler is found and there is a default, use that instead
      if default
        default.new(*conditions)
      else
        raise HandlerRegisterable::Exceptions::NoHandlerAccepted
      end
    end

    private

    def no_handlers_defined?
      self.registered_handlers.nil? || self.registered_handlers.empty?
    end
  end
end
