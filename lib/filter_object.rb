require "filter_object/version"
require "forwardable"

module FilterObject
  module Filter
    extend Forwardable

    def_delegators :@controller, :params, :request, :flash, :redirect_to, :render, :session, :headers, :cookies

    attr_reader :controller

    def filter(controller)
      @controller = controller
    end
  end
end
