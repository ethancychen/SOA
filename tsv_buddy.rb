# Module that can be included (mixin) to create and parse TSV datamodule TsvBuddy
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    require 'CSV'
    csv = CSV.new(tsv, :headers => true, :col_sep => "\t")
    @data = csv.to_a.map {|row| row.to_hash }
  end
  
  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    string = ''
    string << @data[0].keys.join("\t") + "\n"
    0.upto(data.count-1) {|i| string << @data[i].values.join("\t") + "\n"}
    string
  end
end
