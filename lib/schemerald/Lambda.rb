class Lambda
  def initialize(env, forms, params, *code)
    @environment = env
    @forms = forms
    @parameters = params.arrayify
    @code = code
  end

  def call(*args)
    raise SchemeError, "arity mismatch: expected #{@parameters.size} arguments" unless
      args.size == @parameters.size
    new_env = Environment.new(@environment)
    @parameters.zip(args).each do |name, value|
      new_env.define(name, value)
    end
    @code.map{|x| x.scheme_eval(new_env, @forms) }.last
  end
end