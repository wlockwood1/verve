class Store < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

# Method to geocode or reverse_geocode based on what user passes in

  def self.distance_to_verve
    near("5973 Avenida Encinas, Carlsbad, CA", 50000, :order => 'distance')
  end

  def full_address
    [address, postal_code].compact.join(', ')
  end

  # end
  def accessible_attributes
    ['name', 'address' 'city', 'state', 'postal_code', 'country', 'latitude', 'longitude']
    # [:name, :address, :city, :state, :postal_code, :country, :latitude, :longitude]
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      store = find_by_id(row["id"]) || new
      store.attributes = row.to_hash.slice('name', 'address', 'city', 'state', 'postal_code', 'country', 'latitude', 'longitude')
      store.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".tsv" then Roo::CSV.new(file.path, csv_options: {col_sep: "\t"})
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
