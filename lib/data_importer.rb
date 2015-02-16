class DataImporter
  attr_reader :data, :data_file

  def initialize(data_file)
    @data_file = data_file
    @data      = IO.readlines(data_path)
  end

  def run
    data.each do |d|
      Vote.create(DataParser.new(d).to_h) if valid?(d)
    end
  end

  private

  def data_path
    Pathname.new(data_file || default_data_file).realpath
  end

  def default_data_file
    %q[config/notes.txt]
  end

  def valid?(d)
    DataValidator.new(d).valid?
  end
end
