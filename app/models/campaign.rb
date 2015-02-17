class Campaign
  attr_reader :name, :votes

  def initialize(name)
    @name = name
    self
  end

  def self.all
    @all ||= Vote.group(:campaign).map(&:campaign)
  end

  def votes
    @votes ||= Vote.where(campaign: name).counted
  end

  def candidates
    @candidates ||= fetch_candidates
  end

  def invalid_votes
    @invalid_votes ||= Vote.where(campaign: name).not_counted
  end

  def exists?
    all_votes.count > 0
  end

  private

  def fetch_candidates
    choices.inject(Hash.new(0)) do |hsh, v|
      hsh[v] += 1 ; hsh
    end.sort_by(&:last).reverse
  end

  def choices
    votes.to_a.map(&:choice)
  end

  def all_votes
    @all_votes ||= Vote.where(campaign: name)
  end
end
