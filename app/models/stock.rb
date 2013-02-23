module Supplismo
  class Stock
    include DataMapper::Resource

    property :id, Serial
    property :text, String
    property :status_id, Integer, :default => 0

    def class_name
      class_names[status_id] if (0..2).include?(status_id)
    end

    def status
      status_names[status_id] if (0..2).include?(status_id)
    end

    def status=(status)
      self.status_id = status_names.index(status)
    end

    private
    def status_names
      ["empty", "medium", "whole"]
    end

    def class_names
      ["bar-danger", "bar-warning", "bar-success"]
    end
  end
end
