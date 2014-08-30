describe "Interpreter" do
  it "checks list features functionality" do
    interpreter = Interpreter.new
    interpreter.evaluate('(define foo-list (list (+ 3 2) (* 4 5) 6))')
    interpreter.evaluate('(define bar-list (cons 12 foo-list))')
    interpreter.evaluate('(define eggman (quote (you (walrus (hurt the) one) ((you) love))))')
    interpreter.evaluate('(define my-pair (cons (quote foo) (quote bar)))')
    interpreter.evaluate('(set-car! my-pair 27)
(set-cdr! my-pair (cons 64 (quote ())))')
    interpreter.evaluate('(define (f) (list (quote not-a-constant-list)))
(define (g) (quote (constant-list)))')
    interpreter.evaluate('(define e (quote ((a 1) (b 2) (c 3))))')
    expect(interpreter.evaluate("(null? (quote ()))")).
      to eq [true]
    expect(interpreter.evaluate("(list? (quote ()))")).
      to eq [true]
    expect(interpreter.evaluate("(not (pair? (quote ())))")).
      to eq [false]
    expect(interpreter.evaluate("(not (eqv? (quote (5 20 6)) foo-list))")).
      to eq [true]
    expect(interpreter.evaluate("(equal? (quote (5 20 6)) foo-list)")).
      to eq [false]
    expect(interpreter.evaluate("(quote ())")).
      to eq [:nil]
  end
end