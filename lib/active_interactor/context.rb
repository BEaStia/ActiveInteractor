module ActiveInteractor
  class Context
    attr_accessor :data

    def initialize(args = {})
      @status = 'success'
      @data = args.dup
    end

    def method_missing(method_name, *args)
      method_string_name = method_name.to_s
      if method_string_name.chars.last == '='
        @data[method_string_name.delete('=').to_sym] = args.first
      else
        @data.fetch(method_name, nil)
      end
    end

    def fail
      @status = 'fail'
    end

    def failed?
      @status == 'fail'
    end

    def success?
      @status == 'success'
    end
  end
end
