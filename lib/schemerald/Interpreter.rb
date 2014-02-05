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
  FORMS = {}
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