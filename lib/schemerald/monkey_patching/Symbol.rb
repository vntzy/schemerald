class Symbol
  def arrayify
    self == :nil ? [] : self
  end

  def list?
    self == :nil
  end

  def scheme_eval(environment, forms)
    environment.get_value(self)
  end

  def to_sxp
    return "()" if self == :nil
    to_s
  end
end
