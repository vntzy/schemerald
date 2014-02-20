class Interpreter
  DEFAULTS = {
    :and => lambda {|*args| args != [] ? eval(args.join(' and ')) : true },
    :or => lambda {|*args| args != [] ? eval(args.join(' or ')) : false },
    :not => lambda {|x| not x },
    :+ => lambda {|*args| args.reduce(:+) },
    :- => lambda {|*args| args.reduce(:-) },
    :* => lambda {|*args| args.reduce(:*) },
    :/ => lambda {|*args|
      if args.reduce(:/) == args.reduce(:fdiv) or args.reduce(:/).class == Float
        args.reduce(:/)
      else
        args.map{|x| x.to_r }.reduce(:/)
      end
    },
    :"=" => lambda {|*args| args.all?{|x| x == args.first }},
    :> => lambda {|*args| args.each_with_object([1]){|i, a| a << ( a.last > i) << i }.drop(2).all? },
    :< => lambda {|*args| args.each_with_object([1]){|i, a| a << ( a.last < i) << i }.drop(2).all? },
    :>= => lambda {|*args| args.each_with_object([1]){|i, a| a << ( a.last >= i) << i }.drop(2).all? },
    :<= => lambda {|*args| args.each_with_object([1]){|i, a| a << ( a.last <= i) << i }.drop(2).all? },
    :eq? => lambda {|x, y| x.eql? y },
    :eqv? => lambda {|x, y| x == y },
    :equal? => lambda {|x, y| x.eql? y },
    :quotient => lambda {|x, y| x / y },
    :remainder => lambda {|x, y| x.remainder(y) },
    :abs => lambda {|x| x.abs },
    :positive? => lambda {|x| x > 0 },
    :negative? => lambda {|x| x < 0 },
    :zero? => lambda {|x| x == 0 },
    :odd? => lambda {|x| x.odd? },
    :even? => lambda {|x| x.even? },
    :max => lambda {|*args| args.max },
    :min => lambda {|*args| args.min },
    :modulo => lambda {|x, y| x.modulo(y) },
    :car => lambda {|x| x.car },
    :cdr => lambda {|x| x.cdr },
    :cons => lambda {|x, y| Cons.new(x, y) },
    :list => lambda {|*args| args.consify },
    :pair? => lambda {|x| x.is_a?(Cons) ? true : true },
    :null? => lambda {|x| x == :nil },
    :list? => lambda {|x| x.list? },
    :string? => lambda {|x| x.is_a?(String) },
    :procedure? => lambda {|x| x.is_a?(Proc) },
  }

  FORMS = {
    :define => lambda {|env, forms, params, value|
      if params.list?
        env.define(params.car, Lambda.new(env, forms, params.cdr, value))
      else
        env.define(params, value.scheme_eval(env, forms))
      end
    },
    :set! => lambda {|env, forms, name, value| env.set_value(name, value.scheme_eval(env, forms)) },
    :"set-car!" => lambda {|env, forms, list, obj| env.set_value(list, Cons.new(obj.scheme_eval(env, forms), env.get_value(list).cdr)) }, #testme
    :"set-cdr!" => lambda {|env, forms, list, obj| env.set_value(list, Cons.new(env.get_value(list).car, obj.scheme_eval(env, forms))) }, #testme
    :quote => lambda {|env, forms, exp| exp },
    :if => lambda {|env, forms, if_clause, then_clause, else_clause|
      if if_clause.scheme_eval(env, forms) != false
        then_clause.scheme_eval(env, forms)
      else
        else_clause.scheme_eval(env, forms)
      end
    },
    :cond => lambda {|env, forms, *clauses|
      found_clause = clauses.find {|x| x.car == :else or x.car.scheme_eval(env, forms) }
      if found_clause
        found_clause.cdr.arrayify.map{|x| x.scheme_eval(env, forms) }.last or
        found_clause.car.scheme_eval(env, forms)
      else
        nil
      end
    },
    :lambda => lambda {|env, forms, params, *code| Lambda.new(env, forms, params, *code) },
    :apply => lambda {|env, forms, func, list| Cons.new(func, list.scheme_eval(env, forms)).scheme_eval(env, forms) },
    :let => lambda {|env, forms, bindings, body|
      params, values = [], []
      while bindings != :nil do
        params << bindings.car.car
        values << bindings.car.cdr.car
        bindings = bindings.cdr
      end
      Lambda.new(env, forms, params, body).call(*values.map{|value| value.scheme_eval(env, forms) })
    },
  }

  def initialize
    @environment = Environment.new(nil, DEFAULTS)
    @special_forms = Environment.new(nil, FORMS)
  end

  def evaluate(string)
    SXP::Reader::Scheme.read("(#{string})").map{|x| x.consify.scheme_eval(@environment, @special_forms) }
  end

  def repl
    print "> "
    STDIN.each_line do |line|
      begin
        self.evaluate(line).each{|exp| puts exp.to_sxp }
      rescue StandardError => e
        puts "ERROR: #{e}"
      end
      print "> "
    end
  end
end