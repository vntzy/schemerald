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
end