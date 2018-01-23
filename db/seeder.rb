require 'database_cleaner'
require 'csv'

module Seeder
  class << self

    def seed_all
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean
      all_tables.each { |table| seed(table) }
    end

    def seed(table)
      options = { headers: true }
      current_model = model(table)
      CSV.foreach(path(table), options) do |row|
        record = current_model.new(row.to_hash)
      end
    end

    def path(table)
      "db/csv/#{table}.csv"
    end

    def model(table)
      table.to_s.classify.constantize
    end

    def all_tables
      %i{merchants customers items invoices invoice_items transactions}
    end

  end
end
