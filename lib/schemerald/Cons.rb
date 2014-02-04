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
    return car.scheme_eval(environment).call(*cdr.arrayify.map{|x| x.scheme_eval(environment)})
  end
end