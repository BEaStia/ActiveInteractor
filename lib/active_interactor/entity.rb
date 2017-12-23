module ActiveInteractor
  class Entity
    # Implementations of this class should be immutable
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def ==(val)
      val.id == id
    end

    def to_h
      { id: id }
    end

    def to_json
      to_h.to_json
    end
  end
end
