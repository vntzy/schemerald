describe "Interpreter" do
  it "checks numeric features functionality" do
    interpreter = Interpreter.new
    expect(interpreter.evaluate("(+ 137 349)")).
      to eq [486]
    expect(interpreter.evaluate("(- 1000 334)")).
      to eq [666]
    expect(interpreter.evaluate("(* 5 99)")).
      to eq [495]
    expect(interpreter.evaluate("(/ 10 5)")).
      to eq [2]
    expect(interpreter.evaluate("(+ 2.7 10)")).
      to eq [12.7]
    expect(interpreter.evaluate("(+ 21 35 12 7)")).
      to eq [75]
    expect(interpreter.evaluate("(* 25 4 12)")).
      to eq [1200]
    expect(interpreter.evaluate("(+ (* 3 5) (- 10 6))")).
      to eq [19]
    expect(interpreter.evaluate("(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))")).
      to eq [57]
    expect(interpreter.evaluate("(modulo 13 4)")).
      to eq [1]
    expect(interpreter.evaluate("(remainder 13 4)")).
      to eq [1]
    expect(interpreter.evaluate("(modulo -13 4)")).
      to eq [3]
    expect(interpreter.evaluate("(remainder -13 4)")).
      to eq [-1]
  end
end