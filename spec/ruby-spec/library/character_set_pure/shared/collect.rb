shared_examples :sorted_set_1_collect_bang do |method|
  before :each do
    @set = CharacterSet::Pure[1, 2, 3, 4, 5]
  end

  it "yields each Object in self in sorted order" do
    res = []
    CharacterSet::Pure[1, 2, 3].send(method) { |x| res << x; x }
    res.should == [1, 2, 3].sort
  end

  it "returns self" do
    @set.send(method) { |x| x }.should equal(@set)
  end

  it "replaces self with the return values of the block" do
    @set.send(method) { |x| x * 2 }
    @set.should == CharacterSet::Pure[2, 4, 6, 8, 10]
  end
end
