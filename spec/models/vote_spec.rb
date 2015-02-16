describe Vote do
  subject        { Vote.create(input) }
  let(:input)    { { time: '1168041805', campaign: '1168041805', validity: validity, choice: choice }  }
  let(:validity) { 'during'}
  let(:choice)   { 'Antony'}

  describe 'count?' do
    context 'valid' do
      it { expect(subject).to be_counted }
    end

    context 'choice missing' do
      let(:choice) { '' }
      it { expect(subject).to_not be_counted }
    end

    context 'invalid' do
      let(:validity) { 'pre' }
      it { expect(subject).to_not be_counted }
    end
  end
end
