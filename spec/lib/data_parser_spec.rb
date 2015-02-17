describe DataParser do
  subject 	  { DataParser.new(input) }
  let(:input) { %q[VOTE 1168041805 Campaign:ssss_uk_01B Validity:during Choice:Antony] }

  it { expect(subject.time).to eq '1168041805' }
  it { expect(subject.campaign).to eq 'ssss_uk_01B' }
  it { expect(subject.validity).to eq 'during' }
  it { expect(subject.choice).to eq 'Antony' }
  it { expect(subject.to_h).to eq({ time: '1168041805', campaign: 'ssss_uk_01B', validity: 'during', choice: 'Antony' }) }

  context 'missing choice' do
  	let(:input) { %q[VOTE 1168041805 Campaign:ssss_uk_01B Validity:during Choice:] }
  	it { expect(subject.to_h).to eq({ time: '1168041805', campaign: 'ssss_uk_01B', validity: 'during', choice: '' }) }
  end
end
