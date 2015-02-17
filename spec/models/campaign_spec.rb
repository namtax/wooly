describe Campaign do
  let(:camp) { Campaign.new('expected') }
  before     { Campaign.instance_variable_set(:@all, nil) }

  describe '.all' do
    let!(:vote1) { create_vote }
    let!(:vote2) { create_vote }
    let!(:vote3) { create_vote(campaign: 'alabama') }
    it { expect(Campaign.all).to eq %w[alabama expected] }
  end

  describe '#votes' do
    let(:vote1) { create_vote }
    let(:vote2) { create_vote }
    let(:vote3) { create_vote(campaign: 'invalid') }
    it { expect(camp.votes).to eq [vote1, vote2] }
  end

  describe '#candidates' do
    let!(:vote1) { create_vote }
    let!(:vote2) { create_vote }
    let!(:vote3) { create_vote(validity:  'post') }
    let!(:vote4) { create_vote(choice: 'danny') }
    it { expect(camp.candidates).to eq({ 'bobby' => 2, 'danny' => 1}) }
  end

  describe '#invalid_votes' do
    let!(:vote1) { create_vote(validity: '') }
    let!(:vote2) { create_vote(validity: '') }
    it { expect(camp.invalid_votes).to eq [vote1, vote2] }
  end

  def create_vote(opts = {})
    Vote.create(default_opts.merge(opts))
  end

  def default_opts
    { campaign: 'expected', choice: 'bobby', validity: 'during' }
  end
end
