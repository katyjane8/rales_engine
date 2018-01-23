require 'csv'

module Seeder
  class << self

    def seed_all
      all_tables.each { |table| seed(table) }
    end

    def seed(table)
      options = { headers: true }
      CSV.foreach(path(table), options) do |row|
        model(table).insert(row.to_hash)
      end
    end

    def path(table)
      "db/csv/#{table}.csv"
    end

    def model(table)
      table.to_s.classify.constantize
    end

    def all_tables
      %i{merchants items invoices invoice_items customers transactions}
    end

  end
end
