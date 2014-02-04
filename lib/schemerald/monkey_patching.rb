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

  def scheme_eval(environment)
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

  def scheme_eval(environment)
    environment.get_value(self)
  end
end

class Array
  def consify
    map { |x| x.consify }.reverse.reduce(:nil) { |cdr, car| Cons.new(car, cdr) }
  end
end