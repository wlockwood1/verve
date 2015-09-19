class Store < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude, :address => :geocoded_address
  after_validation :reverse_geocode  # auto-fetch address

  def full_address
    [address, postal_code].compact.join(', ')
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    valid_keys = ['name', 'address', 'postal_code', 'latitude', 'longitude']
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      store = find_by_id(row["id"]) || new
      store.attributes = row.to_hash.slice(*valid_keys)
      store.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".tsv" then Roo::CSV.new(file.path, csv_options: {col_sep: "\t"})
    when ".csv" then Roo::CSV.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
