class Cons
  attr_reader :car, :cdr

  def initialize(car, cdr)
    @car = car
    @cdr = cdr
  end

  def arrayify
    return self unless list?
    return [car] + cdr.arrayify
  end

  def list?
    cdr.list?
  end

  def scheme_eval(environment, forms)
    return forms.get_value(car).call(environment, forms, *cdr.arrayify) if forms.defined?(car)
    return car.scheme_eval(environment, forms).call(*cdr.arrayify.map{|x| x.scheme_eval(environment, forms)})
  end

  def to_sxp
    return "(#{car.to_sxp} . #{cdr.to_sxp})" unless list?
    return "(#{arrayify.map{|x| x.to_sxp}})"
  end
end