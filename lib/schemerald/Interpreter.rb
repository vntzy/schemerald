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
    :define => lambda {|env, forms, name, value| env.define(name, value.scheme_eval(env, forms)) },
    :set! => lambda {|env, forms, name, value| env.set_value(name, value.scheme_eval(env, forms)) },
    :quote => lambda {|env, forms, exp| exp == :nil ? nil : exp },
    :if => lambda {|env, forms, if_clause, then_clause, else_clause|
      if if_clause.scheme_eval(env, forms) != false
        then_clause.scheme_eval(env, forms)
      else 
        else_clause.scheme_eval(env, forms)
      end
    },
    :lambda => lambda {|env, forms, params, *code| Lambda.new(env, forms, params, *code) },
    :apply => lambda {|env, forms, func, list| Cons.new(func, list.scheme_eval(env, forms)).scheme_eval(env, forms) },
  }

  def initialize
    @environment = Environment.new(nil, DEFAULTS)
    @special_forms = Environment.new(nil, FORMS)
  end

  def evaluate(string)
    SXP::Reader::Scheme.read(string).consify.scheme_eval(@environment, @special_forms)
  end

  def repl
    print "> "
    STDIN.each_line do |line|
      begin
        puts self.evaluate(line).to_sxp
      rescue StandardError => e
        puts "ERROR: #{e}"
      end
      print "> "
    end
  end
end