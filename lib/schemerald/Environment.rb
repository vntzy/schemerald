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

  def set_value(symbol, value)
    if @defaults.has_key?(symbol)
      @defaults[symbol] = value
    elsif @parent.nil?
      raise SchemeError,
        "assignment disallowed;\ncannot set undefined\nvariable: #{symbol}"
    else
      @parent.set_value(symbol, value)
    end
  end

  def get_value(symbol)
    return @defaults[symbol] if @defaults.has_key?(symbol)
    raise SchemeError,
      "#{symbol}: undefined;\nCannot reference undefined identifier" if @parent.nil?
    return @parent.get_value(symbol)
  end
end