RSpec.describe Tools::Luhn do
  let(:luhn) { Tools::Luhn.new('3') }

  it "doesn\'t allow single digit" do
    luhn = Tools::Luhn.new('3')
    expect(luhn.valid?).to be false
  end

  it 'doesn\'t allow empty strings' do
    luhn = Tools::Luhn.new('')
    expect(luhn.valid?).to be false
  end

  it 'doesn\'t allow single zero input' do
    luhn = Tools::Luhn.new('0')
    expect(luhn.valid?).to be false
  end

  it 'remains valid if digits reserved' do
    luhn = Tools::Luhn.new('059')
    expect(luhn.invalid?).to be true
  end

  it 'becomes invalid if digits reserved' do
    luhn = Tools::Luhn.new('05')
    expect(luhn.valid?).to be false
  end
end