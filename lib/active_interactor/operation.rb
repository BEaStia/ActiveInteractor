module ActiveInteractor
  class MethodValidation
    attr_accessor :field, :method_name, :args

    def initialize(field, method_name, args = nil)
      self.field = field
      self.method_name = method_name
      self.args = args
    end

    def execute(object)
      object.public_send(method_name, object, args)
    end
  end

  class ClassValidation
    attr_accessor :field, :class_name, :args

    def initialize(field, class_name, args = nil)
      self.field = field
      self.class_name = class_name
      self.args = args
    end

    def execute(object)
      Object.const_get(class_name).new.validate(object, args)
    end
  end

  class Operation
    attr_accessor :context

    def initialize(_args = {})
      self.context = ActiveInteractor::Context.new
    end

    class << self
      attr_reader :validations
      VALIDATION_CLASSES = {
        'Symbol'=> ActiveInteractor::MethodValidation,
        'String'=> ActiveInteractor::ClassValidation
      }.freeze

      def validate(field, validation, *args)
        @validations = [] unless @validations != nil
        @validations << VALIDATION_CLASSES[validation.class.to_s].new(field, validation, args)
      end
    end

    def failed?
      context.failed?
    end

    def success?
      context.success?
    end

    def valid?
      self.class.validations.reduce(true) do |status, validation|
        status && validation.execute(self)
      end
    end

    def exec(*_args); end

    def before_call(*_args); end

    def after_call(*_args); end

    def call(*args)
      return unless valid?
      before_call(*args)
      result = exec(*args)
      after_call(*args)
      result
    end
  end


end
