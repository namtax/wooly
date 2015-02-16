describe DataValidator do
	subject 			{ DataValidator.new([input, default].join(" ") ) }
	let(:default) { %q[CONN:MIG01TU MSISDN:00777778359999 GUID:E6109CA1-7756-45DC-8EE7-677CA7C3D7F3 Shortcode:63334] }

	context 'valid' do
		let(:input) { "VOTE 1168041805 Campaign:ssss_uk_01B Validity:during Choice:Antony" }
		it { expect(subject).to be_valid }
	end

	context 'invalid byte sequence' do
		let(:input) { "VOTE 1168123287 Campaign:ssss_uk_02A Validity:during Choice:Antony\xA1\r\n" }
		it { expect(subject).to_not be_valid }
	end

	context 'invalid vote' do
		let(:input) { "VOTEE 1168123287 Campaign:ssss_uk_02A Validity:during Choice:Antony" }
		it { expect(subject).to_not be_valid }
	end

	context 'invalid time' do
		let(:input) { "VOTEE 116812328X Campaign:ssss_uk_02A Validity:during Choice:Antony" }
		it { expect(subject).to_not be_valid }
	end
end