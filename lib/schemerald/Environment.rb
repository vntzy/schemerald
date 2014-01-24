class Environment
	def initialize(parent = nil, defaults = {})
		@parent = parent
		@defaults = defaults
	end

	def define(symbol, value)
		@defaults[symbol] = value
		return value
	end

	def defined?(symbol)
		return true if @defaults.has_key?(symbol)
		return false if @parent.nil?
		return @parent.defined?(symbol)
	end
end