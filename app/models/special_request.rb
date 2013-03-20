module Supplismo
  class SpecialRequest
    include DataMapper::Resource

    property :id, Serial
    property :text, String
    property :ordered, Boolean

  end
end
