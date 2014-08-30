class Array
  def consify
    map { |x| x.consify }.reverse.reduce(:nil) { |cdr, car| Cons.new(car, cdr) }
  end
end
