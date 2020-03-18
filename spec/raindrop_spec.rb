RSpec.describe Tools::Raindrop do
  let(:rdp) { Tools::Raindrop.new(23) }
  it ' should be instance of Tools::Raindrop' do
    expect(rdp).to be_instance_of(Tools::Raindrop)
  end

  it ' should be Integer' do
    expect(rdp.num).to be_a(Integer)
  end

  it ' should return a String' do
    expect(rdp.output).to be_a(String)
  end

  it ' should output "Pling" when it has 3 as factor' do
    rdp = Tools::Raindrop.new(9)
    expect(rdp.output).to eq('Pling')
  end

  it ' should output "Plang" when it has 5 as factor'do
    rdp = Tools::Raindrop.new(20)
    expect(rdp.output).to eq('Plang')
  end

  it ' should output "Plong" when it has 7 as factor'do
    rdp = Tools::Raindrop.new(28)
    expect(rdp.output).to eq('Plong')
  end

  it ' should output "PlingPlang" when it has 3,5 as factor ' do
    rdp = Tools::Raindrop.new(30)
    expect(rdp.output).to eq('PlingPlang')
  end

  it ' should output "PlingPlangPlong" for number 105' do
    rdp = Tools::Raindrop.new(105)
    expect(rdp.output).to eq('PlingPlangPlong')
  end
  it ' should output number as it is, if it doesnt have non of 3,5,7 as factors' do
    rdp = Tools::Raindrop.new(34)
    expect(rdp.output).to eq('34')
  end
end