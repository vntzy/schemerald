describe "Interpreter" do
  it "checks definition features functionality" do
    interpreter = Interpreter.new
    interpreter.evaluate("(define (square x) (* x x))")
    interpreter.evaluate('(define (sum-of-squares x y)
(+ (square x) (square y)))')
    interpreter.evaluate('(define (f a)
(sum-of-squares (+ a 1) (* a 2)))')
    expect(interpreter.evaluate("(square 21)")).
      to eq [441]
    expect(interpreter.evaluate("(square (+ 2 5))")).
      to eq [49]
    expect(interpreter.evaluate("(square (square 3))")).
      to eq [81]
    expect(interpreter.evaluate("(sum-of-squares 3 4)")).
      to eq [25]
    expect(interpreter.evaluate("(f 5)")).
      to eq [136]
    expect(interpreter.evaluate(" ((lambda (a)
((lambda (x y)
(+ (square x) (square y)))
(+ a 1) (* a 2)))
5)")).
      to eq [136]

    interpreter.evaluate('(define (1+ x)
(+ 1 x))')
    expect(interpreter.evaluate("(1+ 2)")).
      to eq [3]
  end
end

