class DataValidator
  attr_reader :input

  EXPECTED_INPUT_SIZE = 9

  def initialize(input)
    @input = input
  end

  def valid?
    well_formed? &&
    valid_size?  &&
    valid_vote?  &&
    valid_time?
  end

  private

  def well_formed?
    input
      .force_encoding('UTF-8')
      .valid_encoding?
  end

  def valid_size?
    input.split.size == EXPECTED_INPUT_SIZE
  end

  def valid_vote?
    input.split.first == 'VOTE'
  end

  def valid_time?
    input.split[1].to_i != 0
  end
end
