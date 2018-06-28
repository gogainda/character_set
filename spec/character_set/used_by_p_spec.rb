shared_examples :character_set_used_by_p do |variant|
  it 'returns true iff the CharacterSet is used by the given string' do
    expect(variant[97, 98, 99].used_by?('a')).to be true
    expect(variant[97, 98, 99].used_by?('z')).to be false
  end
end

describe "CharacterSet#used_by?" do
  it_behaves_like :character_set_used_by_p, CharacterSet
end

describe "CharacterSet::Pure#used_by?" do
  it_behaves_like :character_set_used_by_p, CharacterSet::Pure
end
