class Interpreter
  def initialize
    @environment = Environment.new(nil, DEFAULTS)
    @special_forms = Environment.new(nil, FORMS)
  end

  def evaluate(string)
    SXP::Reader::Scheme.read("(#{string})").
      map{|x| x.consify.scheme_eval(@environment, @special_forms) }
  end

  def scheme_print(output)
    output.each{|exp| puts exp.to_sxp }
  end

  def repl
    print "> "
    STDIN.each_line do |line|
      begin
        return if line.start_with? "exit"
        scheme_print(evaluate(line))
      rescue SchemeError => e
        puts "SchemeError: #{e}"
      rescue StandardError => e
        puts "ERROR: #{e}"
      end
      print "> "
    end
  end
end