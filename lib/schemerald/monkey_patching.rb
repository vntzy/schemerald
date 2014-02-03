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
end

class Symbol
  def arrayify
    self == :nil ? [] : self
  end

  def list?
    self == :nil
  end
end

class Array
  def consify
  end
end