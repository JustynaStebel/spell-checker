namespace :scraper do
  desc "Fetch words from sjp.pl"
  task words_scraper: :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'csv'

    words = []
    url = "http://sjp.pl/slownik/lp.phtml"
    (1..3997).each do |page_number|
      page = url + "?page=" + page_number.to_s
      doc = Nokogiri::HTML(open(page))
      headers = []
      doc.xpath('//*/table/tr/th').each do |th|
        headers << th.text
      end

      rows = []
      doc.xpath('//*/table/tr').each_with_index do |row, i|
        rows[i] = {}
        row.xpath('td').each_with_index do |td, j|
          rows[i][headers[j]] = td.text
        end
      end
      rows.each do |hash|
        hash.delete_if { |key, value| value.empty? }
      end
      rows.delete_if(&:empty?)
      rows.collect! { |h| words << h.values[0] }
    end
    CSV.open("lib/words.csv", "w") do |csv|
      words.each do |word|
        csv << word.split(",")
      end
    end
  end

  desc "Import words to database"
  task words_saver: :environment do
    require 'csv'

    csv = CSV.read("lib/words.csv")
    dictionary = Dictionary.new
    dictionary.words << csv
    dictionary.save!
  end
end
