class DataParser
  attr_reader :data

  def initialize(data)
    @data = data.split
  end

  def time
    data[1]
  end

  def campaign
    fetch_value(data[2])
  end

  def validity
    fetch_value(data[3])
  end

  def choice
    fetch_value(data[4])
  end

  def to_h
    {
      time: time,
      campaign: campaign,
      validity: validity,
      choice: choice
    }
  end

  private

  def fetch_value(entry)
    entry.sub(/\w+\:/,'')
  end
end
