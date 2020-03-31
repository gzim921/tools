
RSpec.describe Tools::Resistor do
  it 'matches a color values with resistance value' do
    resistor = Tools::Resistor.new('brown', 'green', '')
    expect(resistor.value).to eq(15)
  end

  it 'returns 2 colors even we give 3' do
    resistor = Tools::Resistor.new('brown', 'green', 'violet')
    expect(resistor.value).to eq(15)
  end

  it 'showing 3 colors' do
    resistor = Tools::Resistor.new('black', 'white', 'blue')
    expect(resistor.value).not_to be nil
  end
end
