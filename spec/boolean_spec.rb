describe "Interpreter" do
  it "checks boolean functionality" do
    interpreter = Interpreter.new
    expect(interpreter.evaluate("(boolean? #t)")).
      to eq [true]
    expect(interpreter.evaluate('(not (boolean? "Hello, World!"))')).
      to eq [true]
    expect(interpreter.evaluate("(not #f)")).
      to eq [true]
    expect(interpreter.evaluate('(not (not #t))')).
      to eq [true]
    expect(interpreter.evaluate('(not (not "Hello, World!"))')).
      to eq [true]
  end
end