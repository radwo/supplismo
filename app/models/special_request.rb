module Supplismo
  class SpecialRequest
    include DataMapper::Resource

    property :id, Serial
    property :text, String, :required => true
    property :ordered, Boolean, :default => false

  end
end
