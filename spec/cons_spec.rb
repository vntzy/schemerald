describe "Cons#list?" do
  it "checks if cons object is a list" do
    expect(Cons.new(1, 2).list?).to eq false
    expect(Cons.new(1, :nil).list?).to eq true
    expect(Cons.new(1, Cons.new(2, 3)).list?).to eq false
    expect(Cons.new(1, Cons.new(2, Cons.new(3, :nil))).list?).to eq true 
  end
end

describe "Cons#arrayify" do
  it "returns array object representing cons" do
    c1 = Cons.new(1, 2)
    c2 = Cons.new(1, Cons.new(2, 3))
    expect(c1.arrayify).to eq c1
    expect(c2.arrayify).to eq c2
    expect(Cons.new(1, :nil).arrayify).to eq [1]
    expect(Cons.new(1, Cons.new(2, :nil)).arrayify).to eq [1, 2]
  end
end

describe "Cons#to_sxp" do
  it "returns the s expression representation of the cons" do
    c1 = Cons.new(1, 2)
    c2 = Cons.new(1, Cons.new(2, 3))
    expect(c1.to_sxp).to eq "(1 . 2)"
    expect(c2.to_sxp).to eq "(1 . (2 . 3))"
    expect(Cons.new(1, :nil).to_sxp).to eq "(1)"
    expect(Cons.new(1, Cons.new(2, :nil)).to_sxp).to eq "(1 2)"
  end
end