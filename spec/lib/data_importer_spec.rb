describe DataImporter do
	subject 		 { DataImporter.new('spec/fixtures/data.txt') }
	let(:result) { Vote.first }
	before 			 { subject.run }

	it { expect(Vote.count).to eq 1 }
	it { expect(result.time).to eq '1168041805' }
	it { expect(result.campaign).to eq 'ssss_uk_01B' }
	it { expect(result.validity).to eq 'during' }
	it { expect(result.choice).to eq 'Antony' }

	after { Vote.delete_all }
end