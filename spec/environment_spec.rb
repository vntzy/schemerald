describe "Environment#defined?" do
  it "defines a value in the environment" do
    env1 = Environment.new(nil, {:one => 1})
    env2 = Environment.new(env1, {})
    expect(env1.defined? :one).to eq true
    expect(env2.defined? :one).to eq true
  end
end

describe "Environment#set_value" do
  it "sets a value to a reference in the environment" do
    env1 = Environment.new(nil, {:one => 2})
    env2 = Environment.new(env1, {})
    env1.set_value(:one, 1)
    expect(env1.get_value :one).to eq 1
    expect(env2.get_value :one).to eq 1
    expect {env1.set_value(:two, 2)}.to raise_error(SchemeError)
  end
end

describe "Environment#get_value" do
  it "gets a value to a reference in the environment" do
    env1 = Environment.new(nil, {:one => 1})
    env2 = Environment.new(env1, {})
    expect(env1.get_value :one).to eq 1
    expect(env2.get_value :one).to eq 1
    expect {env1.get_value(:two)}.to raise_error(SchemeError)
  end
end
