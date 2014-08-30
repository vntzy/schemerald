class Interpreter
  FORMS = {
    :define => lambda {|env, forms, params, value|
      if params.list?
        env.define(params.car, Lambda.new(env, forms, params.cdr, value))
      else
        env.define(params, value.scheme_eval(env, forms))
      end
    },
    :set! => lambda {|env, forms, name, value|
      env.set_value(name, value.scheme_eval(env, forms))
    },
    :"set-car!" => lambda {|env, forms, list, obj|
      env.set_value(list, Cons.new(obj.scheme_eval(env, forms), env.get_value(list).cdr))
    },
    :"set-cdr!" => lambda {|env, forms, list, obj|
      env.set_value(list, Cons.new(env.get_value(list).car, obj.scheme_eval(env, forms)))
    },
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
    :lambda => lambda {|env, forms, params, *code|
      Lambda.new(env, forms, params, *code)
    },
    :apply => lambda {|env, forms, func, list|
      Cons.new(func, list.scheme_eval(env, forms)).scheme_eval(env, forms)
    },
    :let => lambda {|env, forms, bindings, body|
      params, values = [], []
      while bindings != :nil do
        params << bindings.car.car
        values << bindings.car.cdr.car
        bindings = bindings.cdr
      end
      Lambda.new(env, forms, params, body).
        call(*values.map{|value| value.scheme_eval(env, forms) })
    },
  }
end