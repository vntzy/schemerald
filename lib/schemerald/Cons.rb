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

  def scheme_eval(environment)
    return car.scheme_eval(environment).call(*cdr.arrayify.map{|x| x.scheme_eval(environment)})
  end
end