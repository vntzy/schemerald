class Interpreter
  DEFAULTS = {
    :+ => lambda {|*args| args.reduce(:+) },
    :- => lambda {|*args| args.reduce(:-) },
    :* => lambda {|*args| args.reduce(:*) },
    :/ => lambda {|*args| args.reduce(:/) },
    :car => lambda {|x| x.car },
    :cdr => lambda {|x| x.cdr },
    :cons => lambda {|x, y| Cons.new(x, y) },
    :list => lambda {|*args| args.consify },
  }
  def initialize
    @environment = Environment.new(nil, DEFAULTS)
  end

  def read
  end

  def evaluate
  end

  def print
  end

  def repl
  end
end