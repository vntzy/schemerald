class Object
  def consify
    self
  end

  def arrayify
    self
  end

  def list?
    false
  end

  def scheme_eval(environment, forms)
    self
  end
end

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

class Array
  def consify
    map { |x| x.consify }.reverse.reduce(:nil) { |cdr, car| Cons.new(car, cdr) }
  end
end

class NilClass
  def to_sxp
    "nil"
  end
end