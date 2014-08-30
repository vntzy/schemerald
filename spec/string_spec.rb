describe "Interpreter" do
  it "checks string functionality" do
    interpreter = Interpreter.new
    expect(interpreter.evaluate('(equal? (symbol->string (quote foo)) "foo")')).
      to eq [true]
    expect(interpreter.evaluate('(eqv? (string->symbol "foo") (quote foo))')).
      to eq [true]
    expect(interpreter.evaluate('(string? "foo")')).
      to eq [true]
    expect(interpreter.evaluate('(string-length "smoked salmon")')).
      to eq [13]
    expect(interpreter.evaluate('(string-ref "salmon" 4)')).
      to eq ['o']
    expect{interpreter.evaluate('(string-ref "salmon" 7 )')}.
      to raise_error(SchemeError)
    expect(interpreter.evaluate('(substring "salmon" 1 4)')).
      to eq ['alm']
    expect(interpreter.evaluate('(string-append "foo " "ba" "r baz" "")')).
      to eq ['foo bar baz']
    expect(interpreter.evaluate('(string=? "foo" "foo")')).
      to eq [true]
    expect(interpreter.evaluate('(not (string=? "foo" "Foo"))')).
      to eq [true]
    expect(interpreter.evaluate('(not (string=? "foo" "food"))')).
      to eq [true]
    expect(interpreter.evaluate('(string-ci=? "foo" "Foo")')).
      to eq [true]
    expect(interpreter.evaluate('(not (string-ci=? "food" "Fool"))')).
      to eq [true]
    expect(interpreter.evaluate('(string<? "abacus" "badger")')).
      to eq [true]
    expect(interpreter.evaluate('(string<? "string" "stringify")')).
      to eq [true]
    expect(interpreter.evaluate('(not (string>? "abacus" "badger"))')).
      to eq [true]
    expect(interpreter.evaluate('(string>? "stringify" "string")')).
      to eq [true]
    expect(interpreter.evaluate('(string<=? "foo" "foo")')).
      to eq [true]
    expect(interpreter.evaluate('(not (string<=? "foo" "Foo"))')).
      to eq [true]
    expect(interpreter.evaluate('(string>? "abacus" "Badger")')).
      to eq [true]
  end
end