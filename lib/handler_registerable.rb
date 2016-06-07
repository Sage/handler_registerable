# Module which can be extended into a class/module to provide the following class methods:
#
# registered_handlers - returns a hash which can be modified
# obtain - loop sthrough all registered handlers and returns the first one that handles the
# given condition (tested by calling the handles? class method on the handler class)
module HandlerRegisterable
  autoload :Exceptions, 'handler_registerable/exceptions'
  autoload :Registry, 'handler_registerable/registry'
  autoload :Version, 'handler_registerable/version'
end
