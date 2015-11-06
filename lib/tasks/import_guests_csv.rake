require 'csv'
namespace :import_guests_csv do
  task :create_guests => :environment do
    csv_text = File.read('db/guests_import.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      puts "Creating guests entry with hash: #{row.to_hash}"
      Guest.create!(row.to_hash)
    end
  end
end
