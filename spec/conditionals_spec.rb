describe "Interpreter" do
  it "checks conditional functionality" do
    interpreter = Interpreter.new
    interpreter.evaluate('(define abs (lambda (x)
(cond ((> x 0) x)
((= x 0) (define zero 0) zero)
((< x 0) (- 0 x)))))')
    expect(interpreter.evaluate('(abs 4)')).
      to eq [4]
    expect(interpreter.evaluate('(abs 0)')).
      to eq [0]
    expect(interpreter.evaluate('(abs -13)')).
      to eq [13]

    interpreter.evaluate('(define (abs2 x)
(if (< x 0)
(- x)
x))')
    expect(interpreter.evaluate('(abs2 5)')).
      to eq [5]
    expect(interpreter.evaluate('(abs2 -5)')).
      to eq [-5]
    expect(interpreter.evaluate('(abs2 0)')).
      to eq [0]

    interpreter.evaluate('(define x 7)')
    expect(interpreter.evaluate('(and (> x 5) (<= x 10))')).
      to eq [true]
    expect(interpreter.evaluate('(or (>= x 5) (< x 3))')).
      to eq [true]
  end
end