RSpec.describe Tools::Luhn do
  it 'now allowed single digit strings' do
    luhn = Tools::Luhn.new('1')
    expect(luhn.valid?).to be false
  end


  it 'not allowed single zero' do
    luhn = Tools::Luhn.new('0')
    expect(luhn.valid?).to be false
  end

  it 'becomes valid if reversed 059' do
    luhn = Tools::Luhn.new('059')
    expect(luhn.valid?).to be true
  end

  it 'becomes invalid if reversed 59' do
    luhn = Tools::Luhn.new('59')
    expect(luhn.valid?).to be false
  end

  it 'becomes valid canadian sin' do
    luhn = Tools::Luhn.new('055 444 285')
    expect(luhn.valid?).to be true
  end

  it 'becomes invalid canadian sin' do
    luhn = Tools::Luhn.new('055 444 286')
    expect(luhn.valid?).to be false
  end

  it 'is invalid CC' do
    luhn = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn.valid?).to be false
  end

  it 'not allowed valid strings with a non digit included' do
    luhn = Tools::Luhn.new('055a 444 285')
    expect(luhn.valid?).to be false
  end

  it 'not allowed valid strings with a non digit added to the end ' do
    luhn = Tools::Luhn.new('059a')
    expect(luhn.valid?).to be false
  end

  it 'not allowed valid strings with punctuation included become invalid' do
    luhn = Tools::Luhn.new('055-444-285')
    expect(luhn.valid?).to be false
  end

  it 'not allowed valid strings with symbols' do
    luhn = Tools::Luhn.new('055£ 444$ 285')
    expect(luhn.valid?).to be false
  end

  it 'not allowed single zero with space' do
    luhn = Tools::Luhn.new(' 0')
    expect(luhn.valid?).to be false
  end

  it 'allowed more than a single zero' do
    luhn = Tools::Luhn.new('0000 0')
    expect(luhn.valid?).to be true
  end

  it 'converting input digit 9 if is correctly to output digit 9' do
    luhn = Tools::Luhn.new('091')
    expect(luhn.valid?).to be false
  end

  it 'not allowed strings with non digits' do
    luhn = Tools::Luhn.new(':9')
    expect(luhn.valid?).to be false
  end
end
