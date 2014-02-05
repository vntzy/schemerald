class Interpreter
  DEFAULTS = {
    :"#t" => :"#t",
    :"#T" => :"#t",
    :"#f" => :"#f",
    :"#F" => :"#f",
    :+ => lambda {|*args| args.reduce(:+) },
    :- => lambda {|*args| args.reduce(:-) },
    :* => lambda {|*args| args.reduce(:*) },
    :/ => lambda {|*args| args.reduce(:/) },
    :car => lambda {|x| x.car },
    :cdr => lambda {|x| x.cdr },
    :cons => lambda {|x, y| Cons.new(x, y) },
    :list => lambda {|*args| args.consify },
    :pair? => lambda {|x| x.is_a?(Cons) ? :"#t" : :"#f" }
  }
  FORMS = {
    :define => lambda {|env, forms, name, value| env.define(name, value.scheme_eval(env, forms)) },
    :set! => lambda {|env, forms, name, value| env.set_value(name, value.scheme_eval(env, forms)) },
    :quote => lambda {|env, forms, exp| exp },
    :if => lambda {|env, forms, if_clause, then_clause, else_clause|
      if if_clause.scheme_eval(env, forms) != :"#f"
        then_clause.scheme_eval(env, forms)
      else 
        else_clause.scheme_eval(env, forms)
      end
    },
    :lambda => lambda {|env, forms, params, *code| Lambda.new(env, forms, params, *code) },
  }
  def initialize
    @environment = Environment.new(nil, DEFAULTS)
    @special_forms = Environment.new(nil, FORMS)
  end

  def evaluate(string)
    SXP.parse(string).consify.scheme_eval(@environment, @special_forms)
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