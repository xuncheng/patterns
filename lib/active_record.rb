require "connection_adapter"

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(name, *args)
      if @@connection.columns(self.class.table_name).include?(name)
        @attributes[name]
      else
        super # Raise NoMethodError
      end
    end

    def self.find(id)
      find_by_sql("SELECT * FROM #{table_name} WHERE id = #{id} LIMIT 1").first
    end

    def self.find_by_sql(sql)
      rows = @@connection.execute(sql)
      rows.map { |attributes| new(attributes) }
    end

    def self.table_name
      name.downcase + "s" # User => "users"
    end
  end
end
