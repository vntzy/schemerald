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
