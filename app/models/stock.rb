module Supplismo
  class Stock
    include DataMapper::Resource

    property :id, Serial
    property :text, String
    property :status_id, Integer, :default => 0

    def class_name
      class_names[status_id] if (0..3).include?(status_id)
    end

    def status
      status_names[status_id] if (0..3).include?(status_id)
    end

    def status=(status)
      self.status_id = status_names.key(status)
    end

    private
    def status_names
      {0 => "empty", 1 => "low", 2 => "medium", 3 => "whole"}
    end

    def class_names
      {0 => "bar-danger", 1 => "bar-warning", 2 => "bar-success", 3 => ""}
    end
  end
end
