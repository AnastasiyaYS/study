module Inatra
  class << self
    @@handlers = {}

    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(missing_method_name, arg, &block)
      @@handlers[missing_method_name.to_s] ||= {}
      @@handlers[missing_method_name.to_s][arg] = block.call
    end

    def call(env)
      method = env['REQUEST_METHOD'].downcase
      arg = env['PATH_INFO']
      return [404, {}, ['Not Found']] unless @@handlers[method].key? arg

      @@handlers[method][arg]
    end
  end
end
